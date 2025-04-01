#import <Foundation/Foundation.h>

@interface TaskManager : NSObject

@property (nonatomic, strong) NSMutableArray *tasks;

- (void)addTask:(NSString *)task;
- (void)removeTaskAtIndex:(NSInteger)index;
- (void)listTasks;

@end

@implementation TaskManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _tasks = [NSMutableArray array];
    }
    return self;
}

- (void)addTask:(NSString *)task {
    [self.tasks addObject:task];
    NSLog(@"Tarefa adicionada: %@", task);
}

- (void)removeTaskAtIndex:(NSInteger)index {
    if (index < self.tasks.count) {
        NSString *removedTask = self.tasks[index];
        [self.tasks removeObjectAtIndex:index];
        NSLog(@"Tarefa removida: %@", removedTask);
    } else {
        NSLog(@"Índice inválido.");
    }
}

- (void)listTasks {
    if (self.tasks.count == 0) {
        NSLog(@"Nenhuma tarefa encontrada.");
    } else {
        NSLog(@"Tarefas:");
        for (NSInteger i = 0; i < self.tasks.count; i++) {
            NSLog(@"%ld: %@", (long)i, self.tasks[i]);
        }
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TaskManager *taskManager = [[TaskManager alloc] init];
        char input[256];
        int choice;
        
        while (1) {
            NSLog(@"\n1. Adicionar Tarefa\n2. Remover Tarefa\n3. Listar Tarefas\n4. Sair");
            NSLog(@"Escolha uma opção: ");
            fgets(input, sizeof(input), stdin);
            choice = atoi(input);
            
            switch (choice) {
                case 1: {
                    NSLog(@"Digite a tarefa: ");
                    fgets(input, sizeof(input), stdin);
                    NSString *task = [NSString stringWithUTF8String:input];
                    task = [task stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
                    [taskManager addTask:task];
                    break;
                }
                case 2: {
                    NSLog(@"Digite o índice da tarefa a ser removida: ");
                    fgets(input, sizeof(input), stdin);
                    NSInteger index = atoi(input);
                    [taskManager removeTaskAtIndex:index];
                    break;
                }
                case 3:
                    [taskManager listTasks];
                    break;
                case 4:
                    NSLog(@"Saindo...");
                    return 0;
                default:
                    NSLog(@"Opção inválida. Tente novamente.");
                    break;
            }
        }
    }
    return 0;
}