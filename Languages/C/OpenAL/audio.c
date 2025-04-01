#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <AL/al.h>
#include <AL/alc.h>

#define MAX_TASKS 100
#define TASK_LENGTH 256

char tasks[MAX_TASKS][TASK_LENGTH];
int task_count = 0;

ALCdevice *device;
ALCcontext *context;

void initAudio() {
    device = alcOpenDevice(NULL);
    if (!device) {
        fprintf(stderr, "Não foi possível abrir o dispositivo de áudio.\n");
        exit(1);
    }
    context = alcCreateContext(device, NULL);
    alcMakeContextCurrent(context);
}

void cleanupAudio() {
    alcMakeContextCurrent(NULL);
    alcDestroyContext(context);
    alcCloseDevice(device);
}

void playSound(const char *filename) {
    ALuint buffer;
    ALuint source;
    FILE *file = fopen(filename, "rb");
    if (!file) {
        fprintf(stderr, "Não foi possível abrir o arquivo de áudio.\n");
        return;
    }
    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    fseek(file, 0, SEEK_SET);
    char *data = (char *)malloc(filesize);
    fread(data, 1, filesize, file);
    fclose(file);
    
    alGenBuffers(1, &buffer);
    alGenSources(1, &source);
    alBufferData(buffer, AL_FORMAT_MONO16, data, filesize, 44100);
    alSourcei(source, AL_BUFFER, buffer);
    alSourcePlay(source);
    
    ALint state;
    do {
        alGetSourcei(source, AL_SOURCE_STATE, &state);
    } while (state == AL_PLAYING);
    
    alDeleteSources(1, &source);
    alDeleteBuffers(1, &buffer);
    free(data);
}

void addTask(const char *task) {
    if (task_count < MAX_TASKS) {
        strncpy(tasks[task_count], task, TASK_LENGTH);
        task_count++;
        playSound("task_added.wav");
    }
}

void removeTask(int index) {
    if (index >= 0 && index < task_count) {
        for (int i = index; i < task_count - 1; i++) {
            strncpy(tasks[i], tasks[i + 1], TASK_LENGTH);
        }
        task_count--;
        playSound("task_removed.wav");
    }
}

int main() {
    initAudio();
    char command[256];
    while (1) {
        printf("Digite uma tarefa (ou 'sair' para encerrar): ");
        fgets(command, sizeof(command), stdin);
        command[strcspn(command, "\n")] = 0;
        if (strcmp(command, "sair") == 0) {
            break;
        }
        addTask(command);
        printf("Tarefas:\n");
        for (int i = 0; i < task_count; i++) {
            printf("%d: %s\n", i + 1, tasks[i]);
        }
    }
    cleanupAudio();
    return 0;
}