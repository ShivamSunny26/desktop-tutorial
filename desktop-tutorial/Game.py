import random
import turtle as t


# Constant
WINDOW_WIDTH = 400
WINDOW_HEIGHT = 400
LEAF_SHAPE = ((0,0), (14,2),(18,6),(20,20),(6,18), (2,14))
CATERPILLAR_SPEED= 2
CATERPILLAR_LENGTH = 3
SCORE_FONT = ('Arial', 40,'bold')

# Setup turtle
t.bgcolor('yellow')
t.setup(WINDOW_WIDTH, WINDOW_HEIGHT)

# create turtles
caterpillar = t.Turtle()
caterpillar.shape('square')
caterpillar.color('red')
caterpillar.speed(0)
caterpillar.penup()
caterpillar.hideturtle()

leaf = t.Turtle()
t.register_shape('leaf', LEAF_SHAPE)
leaf.shape('leaf')
leaf.color('green')
leaf.penup()
leaf.hideturtle()
leaf.speed(0)

text_turtle = t.Turtle()
text_turtle.hideturtle()

score_turtle = t.Turtle()
score_turtle.hideturtle()
score_turtle.speed(0)

# Game logic
def outside_window(turtle: t.Turtle) -> bool:
   left_wall = -WINDOW_WIDTH /2
   right_wall = WINDOW_WIDTH/ 2
   top_wall = WINDOW_WIDTH / 2
   bottom_wall = WINDOW_HEIGHT / 2
   (x, y) = caterpillar.pos()
   return x < left_wall or x > right_wall or y < bottom_wall or y > top_wall
   

def display_score(score: int) -> None:
   score_turtle.clear()
   score_turtle.penup()
   x =   WINDOW_WIDTH / 2 - 50
   y = WINDOW_WIDTH / 2 - 50
   score_turtle.setpos(x,y)
   score_turtle.write(str(score), align='right',
                      font = SCORE_FONT)
   
def place_leaf() -> None:
   leaf.ht()
   leaf.setx(random.randint(-200, 200))
   leaf.sety(random.randint(-200,200))
   leaf.st()

def move_turtle(direction: str) -> None:
   """Move the caterpillar in the specified direction"""
   directions = {
        'up': 90,
        'down': 270,
        'left': 180,
        'right': 0
    }
   if direction in directions:
        caterpillar.setheading(directions[direction])

      
def start_game() -> None:
   score = 0
   text_turtle.clear()

   caterpillar_speed = CATERPILLAR_SPEED
   caterpillar_length = CATERPILLAR_LENGTH
   caterpillar.shapesize(1, caterpillar_length, 1)
   caterpillar.showturtle()
   display_score(score)
   place_leaf()

   while True:
      caterpillar.forward(caterpillar_speed)
      if caterpillar.distance(leaf) < 20:
         place_leaf()
         caterpillar_length += 1
         caterpillar.shapesize(1, caterpillar_length, 1)
         caterpillar_speed += 1
         score += 10
         display_score(score)
      if outside_window(caterpillar):
         caterpillar.color('yellow')
         leaf.color('yellow')
         t.penup()
         t.hideturtle()
         t.write('Game Over!', align='center', font = ('Arial', 30, 'normal'))
         break

# Event handling
t.onkey(start_game, 'space')
t.onkey(lambda: move_turtle('up'), 'Up')
t.onkey(lambda: move_turtle('down'),'Down')
t.onkey(lambda: move_turtle('left'), 'Left')
t.onkey(lambda: move_turtle('right'),'Right')
t.listen()
t.mainloop()
