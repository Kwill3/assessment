# Passing Game

**N** players are playing a ball-passing game, and the players are standing in a row.

Initially, every player has their non-negative energy given in the form of an array **A**, where the *i*-th player has energy **A[i]** (1 ≤ **i** ≤ **N**).

You are free to arrange the players in any order circ

Initially, the ball can be held by any player.

The player passes the ball by the following rule:
- If the player has positive energy, they pass the ball to the immediate right player.
- The act of passing the ball takes 1 second.
- The game ends if the player holding the ball has non-positive energy.
- After each pass, the energy of the player reduces by 1.

**Find the maximum duration of the game.**

## Note

**N** is always greater than 0.


## Input Format

The first line contains a single integer *N*, denoting the number of players.

The second line contains *N* space-separated integers of array **A**, denoting the energy of the players.

## Sample Input

```
3       -- denotes N
2 1 1   -- denotes A[i]
```

**Constraints**

- *1 ≤ **N** ≤ 10^5*
- *1 ≤ **i** ≤ **N***
- *1 ≤ **A[i]** ≤ 10^6*

## Output Format

The output contains an integer denoting the maximum duration of the game.

## Sample Output

```
4
```
## Explanation

***A** = [2, 1, 1]*.

One of the optimal orders in which all the players can stand in a row is:

1 -> 2 -> 3 -> 1. The ball is initially with Player 1.

Player 1, in one second, passes the ball to Player 2, and their energy becomes 1.

Player 2, in one second, passes the ball to Player 3, and their energy becomes 0.

Player 3, in one second, passes the ball to Player 1, and their energy becomes 0.

Player 1, in one second, passes the ball to Player 2, and their energy becomes 0.

Player 2 has 0 energy, so they drop the ball.

The game ends.

The maximum duration of the game is 4.

Hence the output is *4*.