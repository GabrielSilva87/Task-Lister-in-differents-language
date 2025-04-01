#include <windows.h>
#include <commctrl.h>
#include <string.h>

#define MAX_TASKS 100
#define TASK_LENGTH 256

char tasks[MAX_TASKS][TASK_LENGTH];
int task_count = 0;

HWND hListBox;
HWND hEdit;

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
    switch (uMsg) {
        case WM_CREATE: {
            hEdit = CreateWindowEx(0, "EDIT", "", WS_CHILD | WS_VISIBLE | WS_BORDER, 10, 10, 200, 25, hwnd, NULL, NULL, NULL);
            CreateWindow("BUTTON", "Adicionar Tarefa", WS_TABSTOP | WS_VISIBLE | WS_CHILD | BS_DEFPUSHBUTTON, 220, 10, 100, 25, hwnd, (HMENU)1, NULL, NULL);
            CreateWindow("BUTTON", "Remover Tarefa", WS_TABSTOP | WS_VISIBLE | WS_CHILD | BS_DEFPUSHBUTTON, 330, 10, 100, 25, hwnd, (HMENU)2, NULL, NULL);
            hListBox = CreateWindowEx(0, WC_LISTBOX, "", WS_CHILD | WS_VISIBLE | LBS_NOTIFY, 10, 50, 420, 200, hwnd, NULL, NULL, NULL);
            break;
        }
        case WM_COMMAND: {
            if (LOWORD(wParam) == 1) { // Adicionar Tarefa
                if (task_count < MAX_TASKS) {
                    GetWindowText(hEdit, tasks[task_count], TASK_LENGTH);
                    SendMessage(hListBox, LB_ADDSTRING, 0, (LPARAM)tasks[task_count]);
                    task_count++;
                    SetWindowText(hEdit, "");
                }
            } else if (LOWORD(wParam) == 2) { // Remover Tarefa
                int index = SendMessage(hListBox, LB_GETCURSEL, 0, 0);
                if (index != LB_ERR) {
                    SendMessage(hListBox, LB_DELETESTRING, index, 0);
                    for (int i = index; i < task_count - 1; i++) {
                        strcpy(tasks[i], tasks[i + 1]);
                    }
                    task_count--;
                }
            }
            break;
        }
        case WM_DESTROY: {
            PostQuitMessage(0);
            break;
        }
        default: {
            return DefWindowProc(hwnd, uMsg, wParam, lParam);
        }
    }
    return 0;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    WNDCLASS wc = {0};
    wc.lpfnWndProc = WindowProc;
    wc.hInstance = hInstance;
    wc.lpszClassName = "TaskListWindowClass";
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    RegisterClass(&wc);

    HWND hwnd = CreateWindowEx(0, "TaskListWindowClass", "Listador de Tarefas", WS_OVERLAPPEDWINDOW | WS_VISIBLE, CW_USEDEFAULT, CW_USEDEFAULT, 450, 300, NULL, NULL, hInstance, NULL);

    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    return 0;
}