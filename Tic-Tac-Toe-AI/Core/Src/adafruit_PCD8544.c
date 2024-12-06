
// PRIVATE INCLUDE
#include "adafruit_PCD8544.h"   // Inclusione della libreria per il display Nokia 5110 PCD8544 (usato per il rendering grafico).
#include <stdbool.h>             // Inclusione del supporto per il tipo di dato booleano (true/false).
#include "spi.h"                 // Inclusione della libreria per la gestione della comunicazione SPI (Serial Peripheral Interface).

// PRIVATE DEFINE

/**
 * @brief Constants for configuring the game grid.
 *
 * The following definitions are used to configure the position and size
 * of the game grid on the display. Each cell in the grid has fixed dimensions,
 * and the starting position is defined by specific offsets.
 */

#define GRID_X_OFFSET 10         ///< Horizontal offset in pixels for the starting position of the grid (from the left edge).
#define GRID_Y_OFFSET 10         ///< Vertical offset in pixels for the starting position of the grid (from the top edge).

#define CELL_WIDTH 10            ///< Width of each cell in the grid (in pixels).
#define CELL_HEIGHT 10           ///< Height of each cell in the grid (in pixels).

#define GRID_WIDTH 30            ///< Total width of the grid (in pixels), considering 3 cells in width + 2 separators.
#define GRID_HEIGHT 30           ///< Total height of the grid (in pixels), considering 3 cells in height + 2 separators.
#define  O   -64  // (value=-64; shift=6; zero_point=0) -> -1.0f
#define  X    64  // (value=64; shift=6; zero_point=0)  ->  1.0f

void delay(int ms);



/**
 * Initial Display Map of LCD
 */
unsigned char displayMap_5110[LCD_WIDTH * LCD_HEIGHT / 8] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (0,0)->(11,7)~ These 12 bytes cover an 8x12 block in the left corner of the display
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (12,0)->(23,7)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, // (24,0)->(35,7)
  0xF0, 0xF8, 0xFC, 0xFC, 0xFE, 0xFE, 0xFE, 0xFE, 0x1E, 0x0E, 0x02, 0x00, // (36,0)->(47,7)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (48,0)->(59,7)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (60,0)->(71,7)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (72,0)->(83,7)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (0,8)->(11,15)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (12,8)->(23,15)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, // (24,8)->(35,15)
  0x0F, 0x1F, 0x3F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFC, 0xF8, // (36,8)->(47,15)
  0xF8, 0xF0, 0xF8, 0xFE, 0xFE, 0xFC, 0xF8, 0xE0, 0x00, 0x00, 0x00, 0x00, // (48,8)->(59,15)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (60,8)->(71,15)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (72,8)->(83,15)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (0,16)->(11,23)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (12,16)->(23,23)
  0x00, 0x00, 0xF8, 0xFC, 0xFE, 0xFE, 0xFF, 0xFF, 0xF3, 0xE0, 0xE0, 0xC0, // (24,16)->(35,23)
  0xC0, 0xC0, 0xE0, 0xE0, 0xF1, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, // (36,16)->(47,23)
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x3E, 0x00, 0x00, 0x00, // (48,16)->(59,23)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (60,16)->(71,23)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (72,16)->(83,23)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (0,24)->(11,31)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (12,24)->(23,31)
  0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, // (24,24)->(35,31)
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, // (36,24)->(47,31)
  0xFF, 0xFF, 0xFF, 0x7F, 0x3F, 0x1F, 0x07, 0x01, 0x00, 0x00, 0x00, 0x00, // (48,24)->(59,31)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (60,24)->(71,31)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (72,24)->(83,31)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (0,32)->(11,39)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (12,32)->(23,39)
  0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0x3F, 0x1F, // (24,32)->(35,39)
  0x0F, 0x0F, 0x0F, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x03, 0x03, // (36,32)->(47,39)
  0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (48,32)->(59,39)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (60,32)->(71,39)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (72,32)->(83,39)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (0,40)->(11,47)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (12,40)->(23,47)
  0x00, 0x00, 0x3F, 0x1F, 0x0F, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, // (24,40)->(35,47)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (36,40)->(47,47)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (48,40)->(59,47)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (60,40)->(71,47)
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // (72,40)->(83,47) !!! The bottom right pixel!

};


/**
 * @brief Function to draw a Tic-Tac-Toe grid with letters and numbers.
 *
 * This function draws a Tic-Tac-Toe game grid on the display, including:
 * - Letters ('a', 'b', 'c') above the grid for column labels.
 * - Numbers ('1', '2', '3') to the left of the grid for row labels.
 * - Horizontal and vertical lines to form the grid structure.
 *
 * The grid consists of 3x3 cells, with appropriate spacing and positioning
 * for the labels and lines. The drawing is done using the `setChar()` function
 * for characters and `setPixel1()` for drawing the grid lines.
 */
void draw_tictactoe_grid() {
    int i, j;

    // Draw the letters above the grid for column labels (a, b, c)
    setChar('a', GRID_X_OFFSET + CELL_WIDTH / 2, GRID_Y_OFFSET - CELL_HEIGHT, true);  // 'a' above the first column
    setChar('b', GRID_X_OFFSET + CELL_WIDTH * 3 / 2, GRID_Y_OFFSET - CELL_HEIGHT, true); // 'b' above the second column
    setChar('c', GRID_X_OFFSET + CELL_WIDTH * 5 / 2, GRID_Y_OFFSET - CELL_HEIGHT, true); // 'c' above the third column

    // Draw the numbers to the left of the grid for row labels (1, 2, 3)
    setChar('1', GRID_X_OFFSET - CELL_WIDTH, GRID_Y_OFFSET + CELL_HEIGHT / 2, true);  // '1' left of the first row
    setChar('2', GRID_X_OFFSET - CELL_WIDTH, GRID_Y_OFFSET + CELL_HEIGHT * 3 / 2, true); // '2' left of the second row
    setChar('3', GRID_X_OFFSET - CELL_WIDTH, GRID_Y_OFFSET + CELL_HEIGHT * 5 / 2, true); // '3' left of the third row

    // Draw horizontal lines to form the grid structure
    for (i = 0; i <= 3; i++) {  // Loop through 4 lines (3 cells + separators)
        for (j = 0; j < GRID_WIDTH; j++) {  // Draw the horizontal pixels for each line
            setPixel1(GRID_X_OFFSET + j, GRID_Y_OFFSET + i * CELL_HEIGHT, true);
        }
    }

    // Draw vertical lines to form the grid structure
    for (i = 0; i <= 3; i++) {  // Loop through 4 lines (3 cells + separators)
        for (j = 0; j < GRID_HEIGHT; j++) {  // Draw the vertical pixels for each line
            setPixel1(GRID_X_OFFSET + i * CELL_WIDTH, GRID_Y_OFFSET + j, true);
        }
    }
}



/**
 * @brief Prints the Tic-Tac-Toe game board on the display.
 *
 * This function iterates over the 3x3 Tic-Tac-Toe game board and draws the corresponding
 * symbols ('X', 'O', or empty space) in each cell on the display using the `draw_symbol_in_cell` function.
 *
 * The board is represented by an array of 9 integers, where each element can be:
 * - `O` for the 'O' player symbol
 * - `X` for the 'X' player symbol
 * - A different value (like 0 or -1) for an empty cell.
 *
 * The function updates the display by calling the `draw_symbol_in_cell` function for each cell.
 *
 * @param board A pointer to the array representing the Tic-Tac-Toe game board.
 *              The board is a 1D array of size 9, where each element represents a cell.
 *              Values should be either `O`, `X`, or a neutral value (like 0 or -1) for an empty cell.
 */
void print_tictactoe_board(int8_t *board) {
    uint8_t i, j;

    // Loop through each cell in the 3x3 Tic-Tac-Toe grid
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            // Draw the appropriate symbol for the current cell
            if (board[i * 3 + j] == O) {
                draw_symbol_in_cell(i, j, 'O');  // Draw 'O' symbol
            } else if (board[i * 3 + j] == X) {
                draw_symbol_in_cell(i, j, 'X');  // Draw 'X' symbol
            } else {
                draw_symbol_in_cell(i, j, ' ');  // Draw empty cell
            }
        }
    }
}



/**
 * @brief Function to draw a symbol ('X' or 'O') in a specified cell of the Tic-Tac-Toe grid.
 *
 * This function draws either an 'X' or an 'O' symbol inside a specific grid cell based on the
 * provided row and column. The position of the symbol is calculated using the grid offsets and
 * cell size. The symbol is drawn using the `setPixel1()` function.
 *
 * @param row The row index (0 to 2) of the cell where the symbol should be drawn.
 * @param col The column index (0 to 2) of the cell where the symbol should be drawn.
 * @param symbol The symbol to draw: either 'X' or 'O'.
 */
void draw_symbol_in_cell(int row, int col, char symbol){
    int i, j;
    // Calculate the top-left position of the cell
    int base_x = GRID_X_OFFSET + col * CELL_WIDTH;
    int base_y = GRID_Y_OFFSET + row * CELL_HEIGHT;

    // Check if the symbol is 'X'
    if (symbol == 'X') {
        // Draw the 'X': two intersecting diagonals
        for (i = 0; i < CELL_WIDTH; i++) {
            // Draw the first diagonal (from top-left to bottom-right)
            setPixel1(base_x + i, base_y + i, true);
            // Draw the second diagonal (from top-right to bottom-left)
            setPixel1(base_x + i, base_y + (CELL_HEIGHT - 1 - i), true);
        }
    }
    // Check if the symbol is 'O'
    else if (symbol == 'O') {
        // Draw the 'O' (circle)
        for (i = 0; i < CELL_WIDTH; i++) {
            for (j = 0; j < CELL_HEIGHT; j++) {
                // Check if the pixel is within the bounds of a circle
                if ((i - CELL_WIDTH / 2) * (i - CELL_WIDTH / 2) + (j - CELL_HEIGHT / 2) * (j - CELL_HEIGHT / 2)
                    <= (CELL_WIDTH / 2) * (CELL_HEIGHT / 2)) {
                    setPixel1(base_x + i, base_y + j, true);
                }
            }
        }
    }
}






/**
 * @brief Function to transmit a single byte over SPI.
 *
 * This function transmits a single byte over the SPI interface using the HAL_SPI_Transmit function.
 * It performs several checks before and after transmission to ensure that the SPI bus is not in an
 * error state and that the transmission is completed successfully. If an error occurs, it invokes
 * the `Error_Handler()` function to handle the error.
 *
 * The function does the following:
 * 1. It checks for any overrun errors on the SPI bus and clears them if present.
 * 2. It sends the byte using the `HAL_SPI_Transmit()` function and checks the result.
 * 3. It waits for the SPI bus to be idle after the transmission is completed.
 *
 * @param c The byte to transmit.
 */
void spi_write(unsigned char c) {
    // Check for overrun errors before transmission
    if (__HAL_SPI_GET_FLAG(&hspi2, SPI_FLAG_OVR)) {
        // Clear overrun error flag if it is set
        __HAL_SPI_CLEAR_OVRFLAG(&hspi2);
    }

    // Use HAL function to transmit a byte over SPI
    HAL_StatusTypeDef status = HAL_SPI_Transmit(&hspi2, &c, 1, HAL_MAX_DELAY);

    // Check the status of the transmission
    if (status != HAL_OK) {
        // Handle error if the transmission fails
        Error_Handler();
    }

    // Wait for the SPI bus to be idle (no ongoing transmission)
    while (__HAL_SPI_GET_FLAG(&hspi2, SPI_FLAG_BSY)) {
        // Wait until SPI is not busy
    }
}




/**
 * @brief Sends a command byte to the LCD.
 *
 * This function sends a command byte to the LCD module. It first selects the LCD chip
 * by pulling the Chip Select (CS) low, then sends the command using the `spi_write()` function,
 * and finally deselects the LCD chip by pulling the CS high.
 *
 * @param data The command byte to send to the LCD.
 */
void LCDcommand(unsigned char data) {
    CS0;              // Pull CS low to select the LCD chip
    LCD_COMMAND;      // Set the LCD in command mode
    spi_write(data);  // Send the command byte using SPI
    CS1;              // Pull CS high to deselect the LCD chip
}

/**
 * @brief Sends data byte to the LCD.
 *
 * This function sends a data byte to the LCD module. It first selects the LCD chip
 * by pulling the Chip Select (CS) low, then sends the data using the `spi_write()` function,
 * and finally deselects the LCD chip by pulling the CS high.
 *
 * @param data The data byte to send to the LCD.
 */
void LCDdata(unsigned char data) {
    CS0;              // Pull CS low to select the LCD chip
    LCD_DATA;         // Set the LCD in data mode
    spi_write(data);  // Send the data byte using SPI
    CS1;              // Pull CS high to deselect the LCD chip
}

/**
 * @brief Prints a string message on the LCD at a specific position.
 *
 * This function prints a string on the LCD at the specified coordinates (x, y).
 * It uses the `setStr()` function to write the string to the display and then updates
 * the display using the `updateDisplay()` function to make the string visible.
 *
 * @param message The string to display on the LCD.
 * @param x The x-coordinate where the string should be displayed.
 * @param y The y-coordinate where the string should be displayed.
 */
void LCD_Print(const char *message, int x, int y) {
    setStr((char *)message, x, y, BLACK);  // Use the existing setStr() function to print the string
    updateDisplay();  // Update the display to show the new string
}


/**
 * @brief Sets a pixel on the display map to the specified color.
 *
 * This function sets a pixel on the displayMap_5110 at the given `(x, y)` coordinates
 * to either black or white. It checks whether the coordinates are within the valid
 * bounds of the display and sets or clears the corresponding bit in the display map.
 *
 * @param x The x-coordinate of the pixel to set.
 * @param y The y-coordinate of the pixel to set.
 * @param bw A boolean value indicating the color to set the pixel to:
 *           - `true` for black
 *           - `false` for white
 */
void setPixel1(int x, int y, bool bw)
{
  // First, double check that the coordinate is in range.
  if ((x >= 0) && (x < LCD_WIDTH) && (y >= 0) && (y < LCD_HEIGHT))
  {
    int shift = y % 8;

    if (bw) // If black, set the bit.
      displayMap_5110[x + (y / 8) * LCD_WIDTH] |= 1 << shift;
    else   // If white clear the bit.
      displayMap_5110[x + (y / 8) * LCD_WIDTH] &= ~(1 << shift);
  }
}

/**
 * @brief Sets a pixel on the display map to black (preferred color).
 *
 * This function is a shortcut to set a pixel to black without specifying the color.
 * It simply calls `setPixel1` with the color set to black (BLACK).
 *
 * @param x The x-coordinate of the pixel to set.
 * @param y The y-coordinate of the pixel to set.
 */
void setPixel(int x, int y)
{
  setPixel1(x, y, BLACK); // Call setPixel1 with bw set to Black
}

/**
 * @brief Clears a pixel on the display map (sets it to white).
 *
 * This function clears a pixel by setting it to white. It calls `setPixel1`
 * with the color set to white (WHITE).
 *
 * @param x The x-coordinate of the pixel to clear.
 * @param y The y-coordinate of the pixel to clear.
 */
void clearPixel(int x, int y)
{
  setPixel1(x, y, WHITE); // call setPixel1 with bw set to white
}

/**
 * @brief Draws a line from `(x0, y0)` to `(x1, y1)` with the specified color.
 *
 * This function uses Bresenham's line algorithm to draw a line from `(x0, y0)`
 * to `(x1, y1)` on the display map. The line is drawn pixel by pixel using
 * the `setPixel1` function, and the color is specified by the `bw` parameter
 * (black or white).
 *
 * @param x0 The starting x-coordinate of the line.
 * @param y0 The starting y-coordinate of the line.
 * @param x1 The ending x-coordinate of the line.
 * @param y1 The ending y-coordinate of the line.
 * @param bw A boolean value indicating the color of the line:
 *           - `true` for black
 *           - `false` for white
 */
void setLine(int x0, int y0, int x1, int y1, bool bw)
{
  int dy = y1 - y0; // Difference between y0 and y1
  int dx = x1 - x0; // Difference between x0 and x1
  int stepx, stepy;

  if (dy < 0)
  {
    dy = -dy;
    stepy = -1;
  }
  else
    stepy = 1;

  if (dx < 0)
  {
    dx = -dx;
    stepx = -1;
  }
  else
    stepx = 1;

  dy <<= 1; // dy is now 2*dy
  dx <<= 1; // dx is now 2*dx
  setPixel1(x0, y0, bw); // Draw the first pixel.

  if (dx > dy)
  {
    int fraction = dy - (dx >> 1);
    while (x0 != x1)
    {
      if (fraction >= 0)
      {
        y0 += stepy;
        fraction -= dx;
      }
      x0 += stepx;
      fraction += dy;
      setPixel1(x0, y0, bw);
    }
  }
  else
  {
    int fraction = dx - (dy >> 1);
    while (y0 != y1)
    {
      if (fraction >= 0)
      {
        x0 += stepx;
        fraction -= dy;
      }
      y0 += stepy;
      fraction += dx;
      setPixel1(x0, y0, bw);
    }
  }
}


/**
 * @brief Draws a rectangle from `(x0, y0)` (top-left corner) to `(x1, y1)` (bottom-right corner).
 *
 * This function can draw either a filled or an unfilled rectangle. The `fill` parameter determines
 * whether the rectangle is filled, and the `bw` parameter defines the color (black or white).
 *
 * @param x0 The x-coordinate of the top-left corner of the rectangle.
 * @param y0 The y-coordinate of the top-left corner of the rectangle.
 * @param x1 The x-coordinate of the bottom-right corner of the rectangle.
 * @param y1 The y-coordinate of the bottom-right corner of the rectangle.
 * @param fill If `true`, the rectangle is filled; otherwise, it is unfilled.
 * @param bw The color of the rectangle, `true` for black, `false` for white.
 */
void setRect(int x0, int y0, int x1, int y1, bool fill, bool bw)
{
  if (fill == 1) // Filled rectangle
  {
    int xDiff;
    xDiff = (x0 > x1) ? x0 - x1 : x1 - x0;
    while (xDiff > 0)
    {
      setLine(x0, y0, x0, y1, bw);
      x0 = (x0 > x1) ? x0 - 1 : x0 + 1;
      xDiff--;
    }
  }
  else // Unfilled rectangle
  {
    setLine(x0, y0, x1, y0, bw);
    setLine(x0, y1, x1, y1, bw);
    setLine(x0, y0, x0, y1, bw);
    setLine(x1, y0, x1, y1, bw);
  }
}

/**
 * @brief Draws a circle centered at `(x0, y0)` with a specified radius.
 *
 * This function draws a circle with a given radius. The circle can have a line thickness, and
 * the color is defined by the `bw` parameter (black or white).
 *
 * @param x0 The x-coordinate of the center of the circle.
 * @param y0 The y-coordinate of the center of the circle.
 * @param radius The radius of the circle.
 * @param bw The color of the circle, `true` for black, `false` for white.
 * @param lineThickness The thickness of the circle's line (1 to radius).
 */
void setCircle(int x0, int y0, int radius, bool bw, int lineThickness)
{
  for (int r = 0; r < lineThickness; r++)
  {
    int f = 1 - radius;
    int ddF_x = 0;
    int ddF_y = -2 * radius;
    int x = 0;
    int y = radius;

    setPixel1(x0, y0 + radius, bw);
    setPixel1(x0, y0 - radius, bw);
    setPixel1(x0 + radius, y0, bw);
    setPixel1(x0 - radius, y0, bw);

    while (x < y)
    {
      if (f >= 0)
      {
        y--;
        ddF_y += 2;
        f += ddF_y;
      }
      x++;
      ddF_x += 2;
      f += ddF_x + 1;

      setPixel1(x0 + x, y0 + y, bw);
      setPixel1(x0 - x, y0 + y, bw);
      setPixel1(x0 + x, y0 - y, bw);
      setPixel1(x0 - x, y0 - y, bw);
      setPixel1(x0 + y, y0 + x, bw);
      setPixel1(x0 - y, y0 + x, bw);
      setPixel1(x0 + y, y0 - x, bw);
      setPixel1(x0 - y, y0 - x, bw);
    }
    radius--;
  }
}

/**
 * @brief Draws a character at the specified `(x, y)` coordinates.
 *
 * This function renders a single ASCII character on the display at the given position, using
 * the specified color (black or white).
 *
 * @param character The ASCII character to display.
 * @param x The x-coordinate where the character will be placed.
 * @param y The y-coordinate where the character will be placed.
 * @param bw The color of the character, `true` for black, `false` for white.
 */
void setChar(char character, int x, int y, bool bw)
{
  int column; // Temporary byte to store character's column bitmap
  for (int i = 0; i < 5; i++) // 5 columns per character
  {
    column = ASCII[character - 0x20][i];
    for (int j = 0; j < 8; j++) // 8 rows per character
    {
      if (column & (0x01 << j)) // Test bits to set pixels
        setPixel1(x + i, y + j, bw);
      else
        setPixel1(x + i, y + j, !bw);
    }
  }
}

/**
 * @brief Draws a string of characters at the specified `(x, y)` coordinates.
 *
 * This function renders a string of characters on the display by calling `setChar` for each
 * character. The string is drawn with progressive coordinates.
 *
 * @param dString The string to display.
 * @param x The starting x-coordinate for the string.
 * @param y The starting y-coordinate for the string.
 * @param bw The color of the string, `true` for black, `false` for white.
 */
void setStr(char * dString, int x, int y, bool bw)
{
  while (*dString != 0x00) // Loop until null terminator
  {
    setChar(*dString++, x, y, bw);
    x += 5;
    for (int i = y; i < y + 8; i++)
    {
      setPixel1(x, i, !bw);
    }
    x++;
    if (x > (LCD_WIDTH - 5)) // Enables wrap around
    {
      x = 0;
      y += 8;
    }
  }
}

/**
 * @brief Draws a bitmap on the display.
 *
 * This function draws a bitmap array on the display. The bitmap should be the same size as
 * the screen and reside in FLASH memory, declared with `PROGMEM`.
 *
 * @param bitArray The bitmap array to display.
 */
void SetBitMap(const char * bitArray)
{
  for (int i = 0; i < (LCD_WIDTH * LCD_HEIGHT / 8); i++)
  {
    char c = bitArray[i];
    displayMap_5110[i] = c;
  }
}

/**
 * @brief Clears the display to either white or black.
 *
 * This function clears the entire display. The color is determined by the `bw` parameter.
 * The screen will be cleared once `updateDisplay()` is called.
 *
 * @param bw The color to clear the display to, `true` for black, `false` for white.
 */
void clearDisplay(bool bw)
{
  for (int i = 0; i < (LCD_WIDTH * LCD_HEIGHT / 8); i++)
  {
    displayMap_5110[i] = bw ? 0xFF : 0;
  }
}

/**
 * @brief Moves the cursor to a specific `(x, y)` position on the display.
 *
 * This function sets the current cursor position to the specified `(x, y)` coordinates.
 *
 * @param x The x-coordinate to move the cursor to.
 * @param y The y-coordinate to move the cursor to.
 */
void gotoXY(int x, int y)
{
  LCDcommand(0x80 | x); // Set column
  LCDcommand(0x40 | y); // Set row
}

/**
 * @brief Updates the display to reflect changes made to `displayMap_5110`.
 *
 * This function writes the contents of `displayMap_5110` to the display, updating the screen
 * to reflect any changes.
 */
void updateDisplay(void)
{
  gotoXY(0, 0);
  for (int i = 0; i < (LCD_WIDTH * LCD_HEIGHT / 8); i++)
  {
    LCDdata(displayMap_5110[i]);
  }
}

/**
 * @brief Sets the display contrast.
 *
 * This function sets the contrast of the display by modifying the Vop value. The contrast
 * value can be between 0 and 127. A range of 40-60 is usually a good choice.
 *
 * @param contrast The contrast value to set (0-127).
 */
void setContrast(int contrast)
{
  LCDcommand(0x21); // Extended commands follow
  LCDcommand(0x80 | contrast); // Set Vop (contrast)
  LCDcommand(0x20); // Set display mode
}

/**
 * @brief Inverts the colors on the display.
 *
 * This function inverts the colors on the display. It can be done by either sending a direct
 * LCD command or by inverting the bits in `displayMap_5110` and updating the display.
 */
void invertDisplay(void)
{
  for (int i = 0; i < (LCD_WIDTH * LCD_HEIGHT / 8); i++)
  {
    displayMap_5110[i] = ~displayMap_5110[i] & 0xFF;
  }
  updateDisplay();
}

/**
 * @brief Initializes the LCD display.
 *
 * This function performs the necessary initialization steps for the LCD screen, including
 * setting the contrast and display mode.
 */
void lcdBegin(void)
{
  RST0;
  HAL_Delay(100);
  RST1;
  CS0;
  LCDcommand(0x21); // Extended commands follow
  delay(10);
  LCDcommand(0xB0); // Set Vop (contrast)
  delay(10);
  LCDcommand(0x04); // Set temperature coefficient
  delay(10);
  LCDcommand(0x14); // Set bias mode 1:48
  delay(10);
  LCDcommand(0x20); // Set display mode
  delay(10);
  LCDcommand(0x0C); // Set display control, normal mode
  delay(10);
}

/**
 * @brief Delays the program for a specified number of milliseconds.
 *
 * This function creates a delay of the specified duration in milliseconds. It uses the
 * SysTick timer to achieve the delay.
 *
 * @param ms The number of milliseconds to delay.
 */
void delay(int ms)
{
  SysTick->LOAD = 16000 - 1; // Assuming 16 MHz clock
  SysTick->VAL = 0;
  SysTick->CTRL = 0x5;
  for (int i = 0; i < ms; i++)
  {
    while (!(SysTick->CTRL & 0x10000)) {}
  }
  SysTick->CTRL = 0;
}


