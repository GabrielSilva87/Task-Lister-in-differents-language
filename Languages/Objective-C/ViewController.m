#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [[NSMutableArray alloc] init];
    self.taskTableView.delegate = self;
    self.taskTableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"];
    }
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

- (IBAction)addTask:(id)sender {
    NSString *task = self.taskTextField.text;
    if (task.length > 0) {
        [self.tasks addObject:task];
        self.taskTextField.text = @"";
        [self.taskTableView reloadData];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tarefa Inválida"
                                                                       message:@"Por favor, digite uma tarefa válida."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)removeTask:(id)sender {
    NSIndexPath *selectedIndexPath = [self.taskTableView indexPathForSelectedRow];
    if (selectedIndexPath) {
        [self.tasks removeObjectAtIndex:selectedIndexPath.row];
        [self.taskTableView deleteRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Seleção Inválida"
                                                                       message:@"Por favor, selecione uma tarefa para remover."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end