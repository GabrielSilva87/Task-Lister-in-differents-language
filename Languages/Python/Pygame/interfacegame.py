import pygame
import sys

pygame.init()

WIDTH, HEIGHT = 400, 300
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Listador de Tarefas")

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
GRAY = (200, 200, 200)

font = pygame.font.Font(None, 36)

tasks = []
input_box = pygame.Rect(10, 10, 280, 40)
color_inactive = pygame.Color('lightskyblue3')
color_active = pygame.Color('dodgerblue2')
color = color_inactive
active = False
text = ''

def draw_tasks():
    y_offset = 60
    for task in tasks:
        task_surface = font.render(task, True, BLACK)
        screen.blit(task_surface, (10, y_offset))
        y_offset += 30

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        
        if event.type == pygame.MOUSEBUTTONDOWN:
            if input_box.collidepoint(event.pos):
                active = not active
            else:
                active = False
            color = color_active if active else color_inactive
        
        if event.type == pygame.KEYDOWN:
            if active:
                if event.key == pygame.K_RETURN:
                    if text:
                        tasks.append(text)
                        text = ''
                elif event.key == pygame.K_BACKSPACE:
                    text = text[:-1]
                else:
                    text += event.unicode

    screen.fill(WHITE)
    pygame.draw.rect(screen, color, input_box, 2)
    txt_surface = font.render(text, True, color)
    screen.blit(txt_surface, (input_box.x + 5, input_box.y + 5))
    draw_tasks()
    
    pygame.display.flip()