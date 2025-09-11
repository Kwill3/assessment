"""Find the maximum duration possible for a ball game"""

def PassingGame(N,A):
    # Sort A in descending order
    A_sorted = sorted(A, reverse=True)
    
    # Simulate starting with the first player (highest energy)
    energies = A_sorted.copy()
    duration = 0
    current = 0  # Start with index 0
    
    while True:
        if energies[current] <= 0:  # Check if the current player can pass
            break
        energies[current] -= 1  # Pass the ball
        duration += 1
        current = (current + 1) % N  # Move to next player
        if energies[current] <= 0 and duration > 0:  # Check if the next player can receive
            break
    print(duration)
    return duration

PassingGame (3, [2, 1, 1]) # 4
PassingGame (4, [3, 0, 2, 1]) # 3
PassingGame (10, [65, 11, 82, 34, 57, 50, 99, 12, 24, 1]) # 19