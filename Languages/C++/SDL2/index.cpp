#include <SDL.h>
#include <SDL_ttf.h>
#include <iostream>
#include <vector>
#include <string>

const int WINDOW_WIDTH = 800;
const int WINDOW_HEIGHT = 600;

class TaskManager {
private:
    std::vector<std::string> tasks;

public:
    void addTask(const std::string& task) {
        tasks.push_back(task);
    }

    void removeTask(int index) {
        if (index >= 0 && index < tasks.size()) {
            tasks.erase(tasks.begin() + index);
        }
    }

    const std::vector<std::string>& getTasks() const {
        return tasks;
    }
};

void renderText(SDL_Renderer* renderer, TTF_Font* font, const std::string& text, int x, int y) {
    SDL_Color color = {255, 255, 255}; // Branco
    SDL_Surface* surface = TTF_RenderText_Solid(font, text.c_str(), color);
    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
    SDL_Rect rect = {x, y, surface->w, surface->h};
    SDL_RenderCopy(renderer, texture, nullptr, &rect);
    SDL_FreeSurface(surface);
    SDL_DestroyTexture(texture);
}

int main(int argc, char* argv[]) {
    SDL_Init(SDL_INIT_VIDEO);
    TTF_Init();

    SDL_Window* window = SDL_CreateWindow("Listador de Tarefas", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, 0);
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    TTF_Font* font = TTF_OpenFont("arial.ttf", 24); // Certifique-se de ter o arquivo arial.ttf no diretório do projeto

    TaskManager taskManager;
    std::string inputTask;
    bool running = true;
    SDL_Event event;

    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = false;
            } else if (event.type == SDL_KEYDOWN) {
                if (event.key.keysym.sym == SDLK_RETURN) {
                    taskManager.addTask(inputTask);
                    inputTask.clear();
                }
            } else if (event.type == SDL_TEXTINPUT) {
                inputTask += event.text.text;
            }
        }

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);

        int y = 50;
        for (const auto& task : taskManager.getTasks()) {
            renderText(renderer, font, task, 50, y);
            y += 30;
        }

        renderText(renderer, font, "Digite uma tarefa e pressione Enter:", 50, 10);
        renderText(renderer, font, inputTask, 50, 20);

        SDL_RenderPresent(renderer);
    }

    TTF_CloseFont(font);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    TTF_Quit();
    SDL_Quit();

    return 0;
}