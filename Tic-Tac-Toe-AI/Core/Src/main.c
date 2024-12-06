/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "spi.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <time.h>
#include <stdbool.h>
#include "neural_network.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "adafruit_PCD8544.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
// Definizione dei simboli
#define  O   -64  // (value=-64; shift=6; zero_point=0) -> -1.0f
#define  X    64  // (value=64; shift=6; zero_point=0)  ->  1.0f

// The TicTacToe board. Can be X (AI), O (Player) or 0 (Free).
int8_t board[9];
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */


// Function to send a string over UART
/**
 * @brief Sends a string message through the specified UART interface.
 *
 * This function transmits a string message to the connected device via the UART
 * peripheral using the HAL_UART_Transmit function.
 *
 * @param huart Pointer to the UART_HandleTypeDef structure that contains
 *              the configuration information for the UART.
 * @param message Pointer to the string that needs to be transmitted.
 */
void Serial_Print(UART_HandleTypeDef *huart, const char *message) {
    HAL_UART_Transmit(huart, (uint8_t *)message, strlen(message), HAL_MAX_DELAY);
}


// Function to read a single character from UART
/**
 * @brief Reads a single character from the specified UART interface.
 *
 * This function waits for and receives a single character from the UART
 * interface. It blocks until a character is received, using the HAL_UART_Receive function.
 *
 * @param huart Pointer to the UART_HandleTypeDef structure that contains
 *              the configuration information for the UART.
 * @return uint8_t The received character.
 */
uint8_t Serial_ReadChar(UART_HandleTypeDef *huart) {
    uint8_t ch;
    HAL_UART_Receive(huart, &ch, 1, HAL_MAX_DELAY);
    return ch;
}


/**
 * @brief Checks if the Tic-Tac-Toe game board is full.
 *
 * This function iterates through the game board to check if all the cells
 * are filled with either an 'X' or an 'O'. If any cell is unfilled, it returns false.
 * If all cells are filled, it returns true.
 *
 * @param board An array representing the current state of the game board.
 *              The board is a 1D array with 9 elements, where each element
 *              represents a cell on the Tic-Tac-Toe grid.
 * @return bool True if the board is full, false otherwise.
 */
bool isFull(int8_t board[9]) {
    for (int i = 0; i < 9; i++) {
        if (board[i] != O && board[i] != X) {
            return false;
        }
    }
    return true;
}



/**
 * @brief Determines the winner of the Tic-Tac-Toe game.
 *
 * This function checks the game board to determine if there is a winner. It evaluates the
 * rows, columns, and diagonals to see if all cells in any row, column, or diagonal contain
 * the same symbol ('X' or 'O'). If so, it returns the winner symbol. If no winner is found,
 * it returns 0 (indicating a draw or incomplete game).
 *
 * The game board is represented as a 1D array of 9 elements, with each element being one of
 * the following:
 * - `X` for player X's move
 * - `O` for player O's move
 * - 0 or a neutral value for an empty cell.
 *
 * @param board A pointer to the array representing the Tic-Tac-Toe game board.
 *              The board is a 1D array of size 9, where each element represents a cell.
 *              The values should be either `X`, `O`, or a neutral value (such as 0) for an empty cell.
 *
 * @return Returns `X` if player X wins, `O` if player O wins, or `0` if there is no winner (draw or game in progress).
 */
int8_t winner(int8_t *board) {
    int i, j;
    int x_count = 0;
    int o_count = 0;

    // Check rows for a winner
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (board[3 * i + j] == X) {
                x_count++;
            } else if (board[3 * i + j] == O) {
                o_count++;
            }
        }
        if (x_count == 3) return X;   // X wins if there are 3 X's in a row
        else if (o_count == 3) return O; // O wins if there are 3 O's in a row
        else x_count = o_count = 0;    // Reset counts for the next row
    }

    // Check columns for a winner
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (board[3 * j + i] == X) {
                x_count++;
            } else if (board[3 * j + i] == O) {
                o_count++;
            }
        }
        if (x_count == 3) return X;  // X wins if there are 3 X's in a column
        else if (o_count == 3) return O; // O wins if there are 3 O's in a column
        else x_count = o_count = 0;  // Reset counts for the next column
    }

    // Check the first diagonal for a winner
    for (i = 0; i < 3; i++) {
        if (board[3 * i + i] == X) {
            x_count++;
        } else if (board[3 * i + i] == O) {
            o_count++;
        }
    }
    if (x_count == 3) return X;  // X wins if there are 3 X's on the diagonal
    else if (o_count == 3) return O; // O wins if there are 3 O's on the diagonal
    else x_count = o_count = 0;  // Reset counts for the next diagonal

    // Check the second diagonal for a winner
    for (i = 0; i < 3; i++) {
        if (board[3 * i + 2 - i] == X) {
            x_count++;
        } else if (board[3 * i + 2 - i] == O) {
            o_count++;
        }
    }
    if (x_count == 3) return X;  // X wins if there are 3 X's on the second diagonal
    else if (o_count == 3) return O; // O wins if there are 3 O's on the second diagonal

    return 0; // No winner, game is either ongoing or a draw
}



/**
 * @brief Implements the Tic-Tac-Toe game logic.
 *
 * This function implements the main game loop for a Tic-Tac-Toe game between a human player and an AI.
 * The game is played through serial communication, where the user inputs their move in the form of coordinates
 * (e.g., 'a1', 'b2', etc.), and the AI responds with its move.
 * The game continues until either the user or the AI wins, or the board is full and the game is drawn.
 *
 * The game board is managed as a 1D array with 9 cells, where `O` is the human player's move and `X` is the AI's move.
 * The user is asked to input their move via serial communication, and the game state is printed and updated on the display.
 *
 * @param huart A pointer to the UART_HandleTypeDef structure, which is used for serial communication.
 */
void tictactoe_game(UART_HandleTypeDef *huart) {

    uint8_t action;
    char user_input[2];
    uint8_t i;
    char buffer[100];

    // Initialize the game board (clear all cells)
    for (i = 0; i < 9; i++) {
        board[i] = 0;  // 0 represents an empty cell
    }

    // Start the Tic-Tac-Toe game and notify the player
    Serial_Print(huart,"############ New Game ############\n");

    // Print the current game board
    print_tictactoe_board(board);

    // Update the LCD display
    updateDisplay();

    delay(1000); // Wait for 1 second before starting the game

    // Main game loop (up to 5 turns, alternating between player and AI)
    for (i = 0; i < 5; i++) {
        user_input[0] = user_input[1] = 0; // Reset user input

        // Loop to read valid user input (coordinates in the form of 'a1', 'b3', etc.)
        while (1) {
            // Prompt user for input
            Serial_Print(huart,"Your turn: Please enter the coordinates (e.g. a3)\n");
            Serial_Print(huart, "you want to place an O and press >enter<\n");

            // Read the first character (column)
            user_input[0] = Serial_ReadChar(huart);
            delay(10);  // Small delay to prevent synchronization issues
            //Serial_Print(huart, "I read the first character!");

            // Read the second character (row)
            user_input[1] = Serial_ReadChar(huart);
            delay(10);  // Small delay to prevent synchronization issues
            //Serial_Print(huart, "I read the second character!");

            // Calculate the action (convert coordinates to board index)
            action = (user_input[0] - 97) + (user_input[1] - 48 - 1) * 3;

            // Validate user input: check for correct coordinates and empty cell
            if ((user_input[0] < 97 || user_input[0] > 99 || user_input[1] < 49 || user_input[1] > 51)) {
                Serial_Print(huart,"Wrong input. The coordinates have to be\n");
                Serial_Print(huart,"one of {a1, a2, a3, b1, b2, b3, c1, c2, c3}.\n");
                user_input[0] = user_input[1] = 0; // Reset input and prompt again
                continue;
            } else if (board[action] != 0) {
                Serial_Print(huart,"Wrong input. The field is already occupied.\n");
                user_input[0] = user_input[1] = 0; // Reset input and prompt again
                continue;
            }

            break;  // Exit the loop once valid input is provided
        }

        // Update the board with the user's move (O)
        board[action] = O;

        // Print user's move
        snprintf(buffer, 100, "User's move: %c, %c\n", user_input[0], user_input[1]);
        Serial_Print(huart, buffer);

        // Print the updated game board
        print_tictactoe_board(board);

        // Update the LCD display
        updateDisplay();

        delay(1000); // Wait for 1 second before continuing

        // Check if the user has won the game
        if (winner(board) == O) {
            Serial_Print(huart,"******* Congratulations: You won the game! *******\n");
            Serial_Print(huart, "This should be impossible in theory.\n");
            break;
        }

        // Measure the time taken for the AI to make its move
        double time_spent = 0.0;
        clock_t begin = clock();

        // Let the AI make its move
        action = run_ai_agent(board);

        clock_t end = clock();
        time_spent += (double)(end - begin) / CLOCKS_PER_SEC;

        // Update the board with AI's move (X)
        board[action] = X;

        // Print the time taken for AI's move
        snprintf(buffer, 100, "The AI took %f seconds to think about the turn.\n", time_spent);
        Serial_Print(huart, buffer);

        // Print AI's move
        snprintf(buffer, 100, "AI's move was %c%d\n", (char)(action % 3 + 97), (int)(action / 3 + 1));
        Serial_Print(huart, buffer);

        // Print the updated game board
        print_tictactoe_board(board);

        // Update the LCD display
        updateDisplay();

        // Check if the AI has won the game
        if (winner(board) == X) {
            Serial_Print(huart,"******* You lost the game! *******\n");

            delay(2000); // Wait for 2 seconds

            // Clear the LCD display and show the "You Lost" message
            clearDisplay(false);
            LCD_Print("You Lost the Game!", 0, 7);
            clearDisplay(false);

            delay(20000); // Wait for 20 seconds

            // Reset the game board and display
            draw_tictactoe_grid();
            updateDisplay();

            break;  // End the game
        }

        // Check if the board is full (game ends in a draw)
        if (isFull(board)) {
            Serial_Print(huart, "\n The board is full! Restarting the game.\n");

            clearDisplay(false);
            delay(2000);

            // Reset the board and redraw the grid
            draw_tictactoe_grid();
            delay(2000);

            updateDisplay();
        }
    }
}



/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_SPI2_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
  /**
   * Define the initialization of SPI LCD module
   */
  lcdBegin();
  setContrast(50);
  updateDisplay();

  delay(20000);

  clearDisplay(false);

  LCD_Print("Welcome in Tic-Tac-Toe Game", 1, 8);

  delay(5000);


  clearDisplay(false);

  delay(5000);

  draw_tictactoe_grid();

  updateDisplay();

  delay(5000);

  init_ai_agent(&huart2);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */
	  tictactoe_game(&huart2);
    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
