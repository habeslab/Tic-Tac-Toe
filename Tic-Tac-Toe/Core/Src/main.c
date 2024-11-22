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
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#include <string.h>
#include <aifes.h>
#include "neural_network.h"
#include <time.h>
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

// Funzione per inviare una stringa sulla seriale
void Serial_Print(UART_HandleTypeDef *huart, const char *message) {
    HAL_UART_Transmit(huart, (uint8_t *)message, strlen(message), HAL_MAX_DELAY);
}


// Funzione per leggere un singolo carattere dalla UART
uint8_t Serial_ReadChar(UART_HandleTypeDef *huart) {
    uint8_t ch;
    HAL_UART_Receive(huart, &ch, 1, HAL_MAX_DELAY);
    return ch;
}

// Funzione per stampare la board del Tic Tac Toe sulla seriale
void print_tictactoe_board(UART_HandleTypeDef *huart, int8_t *board) {
    uint8_t i, j;
    char buffer[32];

    Serial_Print(huart, "\n     a   b   c  \n");
    Serial_Print(huart, "   ------------- \n");

    for (i = 0; i < 3; i++) {
        snprintf(buffer, sizeof(buffer), "%d | ", i + 1);
        Serial_Print(huart, buffer);

        for (j = 0; j < 3; j++) {
            if (board[i * 3 + j] == O) {
                Serial_Print(huart, "O | ");
            } else if (board[i * 3 + j] == X) {
                Serial_Print(huart, "X | ");
            } else {
                Serial_Print(huart, "  | ");
            }
        }

        Serial_Print(huart, "\n   ------------- \n");
    }
    Serial_Print(huart, "\n");
}

// Funzione per determinare il vincitore del Tic Tac Toe
int8_t winner(int8_t *board) {
    int i, j;
    int x_count = 0;
    int o_count = 0;

    // Controlla le righe
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (board[3 * i + j] == X) {
                x_count++;
            } else if (board[3 * i + j] == O) {
                o_count++;
            }
        }
        if (x_count == 3) return X;
        else if (o_count == 3) return O;
        else x_count = o_count = 0;
    }

    // Controlla le colonne
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (board[3 * j + i] == X) {
                x_count++;
            } else if (board[3 * j + i] == O) {
                o_count++;
            }
        }
        if (x_count == 3) return X;
        else if (o_count == 3) return O;
        else x_count = o_count = 0;
    }

    // Controlla le diagonali
    for (i = 0; i < 3; i++) {
        if (board[3 * i + i] == X) {
            x_count++;
        } else if (board[3 * i + i] == O) {
            o_count++;
        }
    }
    if (x_count == 3) return X;
    else if (o_count == 3) return O;
    else x_count = o_count = 0;

    for (i = 0; i < 3; i++) {
        if (board[3 * i + 2 - i] == X) {
            x_count++;
        } else if (board[3 * i + 2 - i] == O) {
            o_count++;
        }
    }
    if (x_count == 3) return X;
    else if (o_count == 3) return O;

    return 0;
}

void tictactoe_game(UART_HandleTypeDef *huart) {
	uint8_t action;
	char user_input[2];
	uint8_t i;

	// Reset the board
	    for (i = 0; i < 9; i++) {
	        board[i] = 0;
	    }

	    // TicTacToe agent
	    Serial_Print(&huart2, "############ New Game ############\n");
	    print_tictactoe_board(&huart2, board);

	    for (i = 0; i < 5; i++) {
	        user_input[0] = user_input[1] = 0;

	        // Loop for reading valid input
	        while (1) {
	            Serial_Print(&huart2, "\nYour turn: Please enter the coordinates (e.g. a3) you want to place an O and press >enter<\n");

	            // Leggi il primo carattere
	            user_input[0] = Serial_ReadChar(&huart2);
	            HAL_Delay(10);  // Aggiungi un piccolo ritardo per evitare problemi di sincronizzazione

	            // Leggi il secondo carattere
	            user_input[1] = Serial_ReadChar(&huart2);
	            HAL_Delay(10);  // Aggiungi un piccolo ritardo per evitare problemi di sincronizzazione

	            // Calcola l'azione
	            action = (user_input[0] - 97) + (user_input[1] - 48 - 1) * 3;

	            // Verifica se l'input è valido
	            if ((user_input[0] < 97 || user_input[0] > 99 || user_input[1] < 49 || user_input[1] > 51)) {
	                Serial_Print(&huart2, "Wrong input. The coordinates have to be one of {a1, a2, a3, b1, b2, b3, c1, c2, c3}.\n");
	                user_input[0] = user_input[1] = 0;
	                continue;
	            } else if (board[action] != 0) {
	                Serial_Print(&huart2, "Wrong input. The field is already occupied.\n");
	                user_input[0] = user_input[1] = 0;
	                continue;
	            }

	            break;  // Esce dal ciclo solo se l'input è valido
	        }

	        // Update the board with user's action
	        board[action] = O;

	        char buffer[100];
	        snprintf(buffer, 100, "Scelta fatta dall'Utente : %c , %c\n", user_input[0], user_input[1]);
	        Serial_Print(&huart2, buffer);

	        print_tictactoe_board(&huart2, board);

	        if (winner(board) == O) {
	            Serial_Print(&huart2, "\n ******* Congratulations: You won the game! This should be impossible in theory. ******* \n\n");
	            break;
	        }

	        // Memorizzo il tempo di esecuzione del codice
	        double time_spent = 0.0;
	        clock_t begin = clock();

	        action = run_ai_agent(board);

	        clock_t end = clock();

	        // Calcola il tempo trascorso
	        time_spent += (double)(end - begin) / CLOCKS_PER_SEC;

	        // Update the board with AI's action
	        board[action] = X;

	        snprintf(buffer, 100, "The AI took %f μs to think about the turn.\n", time_spent);
	        Serial_Print(&huart2, buffer);
	        snprintf(buffer, 100, "\nAIs turn was %c%d\n", (char)(action % 3 + 97), (int)(action / 3 + 1));
	        Serial_Print(&huart2, buffer);

	        print_tictactoe_board(&huart2, board);

	        if (winner(board) == X) {
	            Serial_Print(&huart2, "\n ******* You lost the game! ******* \n\n");
	            break;
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
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
  // Init neural network
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
