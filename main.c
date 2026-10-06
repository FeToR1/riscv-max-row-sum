#include <stdio.h>

int max_sum_row(int rows, int cols, const int matrix[rows][cols]) {
    int max_index = 0;
    int max_sum = 0;

    for (int j = 0; j < cols; j++) {
        max_sum += matrix[0][j];
    }

    for (int i = 1; i < rows; i++) {
        int sum = 0;

        for (int j = 0; j < cols; j++) {
            sum += matrix[i][j];
        }

        if (sum > max_sum) {
            max_sum = sum;
            max_index = i;
        }
    }

    return max_index;
}

int main(void) {
    int ROWS = 6;
    int COLS = 6;

    const int matrix[6][6] = {{1, 2, 3, 4, 5, 6}, {1, 2, 3, 4, 5, 6}, {6, 2, 3, 4, 5, 6},
                                    {6, 1, 3, 4, 5, 6}, {1, 2, 3, 4, 5, 6}, {1, 2, 3, 4, 5, 6}};

    int result = max_sum_row(ROWS, COLS, matrix);
    printf("%d\n", result);

    return 0;
}
