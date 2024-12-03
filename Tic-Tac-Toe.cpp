#include<iostream>
using namespace std;

void drawBoard (char board[3][3]){
    cout << "--------------------\n";
    for (int i = 0; i < 3; i++)
    {
        cout << "| ";
        for (int j=0; j<3; j++) {
            cout << board[i][j] << " | ";
        }
        cout << "\n--------------\n";

    }
}


bool checkWin(char board[3][3], char player) {
    for (int i = 0; i< 3; i++ )
    {
        if (board [i][0] == player && board[i][1] == player && board[i][2] == player)
            return true;
        if (board [0][i] == player && board[1][i] == player && board[2][i] == player)
            return true;
    }

    if (board[0][0] == player && board[1][1] == player && board[2][2] == player)
        return true;
    if (board[0][2] == player && board[1][1] == player && board[2][0] == player)
        return true;
    return false;
}

int main(){
    char board[3][3] = {{' ',' ',' '},{' ',' ',' '},{' ',' ',' '}};
    char currentPlayer = 'X';
    
    cout << "Welcome to Tic-Tac-Toe\n";
    drawBoard(board);

    int row, col;

    while (true) {
        cout << "Player" << currentPlayer << ", enter row (0-2) and column (0-2): ";
        cin >> row >> col;

        if (row < 0 || row > 2 || col < 0 || col >2 || board[row][col] != ' '){
            cout << "Invalid move. Try again. \n";
            continue;
        }

        board[row][col] = currentPlayer;
        drawBoard(board);

        if (checkWin(board, currentPlayer)) {
            cout << "Player " << currentPlayer << " Wins!\n";
            break;
        }

        if(currentPlayer == 'X')
            currentPlayer='0';
        else
            currentPlayer = 'X';
    }


    cout << "Game over. Thanks for Playing!\n";
    return 0;
    
}