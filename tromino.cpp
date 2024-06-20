#include <iostream>
#include <cmath>

using namespace std;

const int N = pow(2, 10);

int n;
bool hole[N][N];

void divide(int x1, int y1, int x2, int y2) {
  if ((x2 - x1 + 1) == 2 && (y2 - y1 + 1) == 2) {
    if (!hole[x1][y1] && hole[x1][y1 + 1]) {
      hole[x1 + 1][y1] = hole[x1 + 1][y1 + 1] = true;
    } else if (!hole[x1][y1] && hole[x1 + 1][y1]) {
      hole[x1][y1 + 1] = hole[x1 + 1][y1 + 1] = true;
    } else if (!hole[x1][y1 + 1] && hole[x1 + 1][y1]) {
      hole[x1][y1] = hole[x1 + 1][y1 + 1] = true;
    } else if (!hole[x1][y1 + 1] && hole[x1 + 1][y1 + 1]) {
      hole[x1][y1] = hole[x1 + 1][y1] = true;
    }
    return;
  }

  int midX = (x1 + x2) / 2;
  int midY = (y1 + y2) / 2;

  if (hole[midX][midY]) {
    hole[midX][midY] = false;
    hole[midX + 1][midY] = hole[midX][midY + 1] = hole[midX + 1][midY + 1] = true;
    divide(x1, y1, midX, midY);
    divide(x1, midY + 1, midX, y2);
    divide(midX + 1, y1, x2, midY);
    divide(midX + 1, midY + 1, x2, y2);
  } else {
    divide(x1, y1, midX, midY);
    divide(x1, midY + 1, midX, y2);
    divide(midX + 1, y1, x2, midY);
    divide(midX + 1, midY + 1, x2, y2);
  }
}

int main() {
  n = pow(2, 4);

  int x, y;
  cin >> x >> y;
  hole[x][y] = true;

  divide(0, 0, n - 1, n - 1);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      cout << (hole[i][j] ? "x" : ".");
    }
    cout << endl;
  }

  return 0;
}
