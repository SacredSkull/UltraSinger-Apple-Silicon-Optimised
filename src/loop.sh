#!/bin/bash

# Function to initialize the terminal
init_terminal() {
    tput clear
    tput cup 0 0
    tput civis  # Hide cursor
}

# Function to reset the terminal
reset_terminal() {
    tput cnorm  # Show cursor
    tput sgr0   # Reset all attributes
    tput clear
}

# Function to display the ASCII art
show_ascii_art() {
    tput cup 1 0
    echo "



                                                 ██
                                                ████
                                               ██████
                                              ████████
                                             ██████████
                                            ████████████
                                           ██████  ██████
                                          ██████    ██████
                                         ████▓           ██
                                        ██    █ █ █ ██ ██
                              ▒█       █▓ ▓█ █ █ █ █████   █        █   ░
                                      ██ █ ▓        ██      ██            ▓
                          ▒        ▓███  █████ ███████████  ███ █        ░
                             ▒█████████ ▓█   ▓ ████████   ██▓███ ██████
                        ██████████████▒ ███░       ██  ████ ████ ███████████░
                  ██████████████████    ▒████ ▓██████████ █  ██▓ ░████████████████
            ██████████████████         ▒    ██ ███████  ███ █░█▓      ██████████████████
          ██████████████           ░█  ███        ██  ▒██▒░ ██░▒           ░██████████████
            ███████           ███████  █████ ░██████████ ▓█ ███  █████░          ███████
              ███████     ███████████    ███ █████████  ██ ▒███ ██████████     ███████
               ░███████    ▒████████  ██          █   ███  ███  ████████     ███████
                 ████████    ███████  █████  ██▓▓▓██████ █ ███  ███████    ████████
                   ███████     █████ █     █ █ █░▓█    ▒██████  █████    ████████
                     ███████     ███ █ █ █ █ █ ████        █ █ ████     ███████
                       ███████     █ ▓██ █ █ ████ ██     █████ ██     ███████
                         ███████    ▓ █ █▒█▓█ █ ██ ███  █████  ▓    ███████
                          ███████   ██  ██▓█ █░██▒██ ██ ████  █▒   ██████▒
                            █████   ████  ▓████████████████  ███   █████
                           ██████   ███████  █████░ █████  █████   ▓█████
                           █████    ███████ █       ████  ██████    █████
                           █████   ███████ ▒  ███  █ ▒██ ████████   █████
                          ██████   ██████  █  ███  █ █ █ ████████   ██████
                          █████    ███████ ░██   ████ █  ████████    █████
                          █████   ██████     █   ▒███░      ▓█████   █████
                         ██████   █         ██████ ███ █         █   ██████
                         █████          ███ █    █████ █████░         █████
                         █████     ████████ █    █████  █████████     █████
                        ███████████████████ █ ██ █████  ████████████████████
                        ████████████████▓   █ ██ █████      ████████████████
                       ░███████████▓        █    █████          ▒███████████
                       ████████             █    █████               ▓███████
                       ███                  █▓▒▓██████                    ███
                                              █████ ██
                                              █████ ██
                                              █████ ██
                                      ░▒▓█▓█████████████████░




                                                                                                     "
}

# Function to display the input prompt
show_input_prompt() {
    tput cup 52 0
    echo -n "Enter a URL/YouTube link or path to file or type 'quit' to exit: "
}

# Function to read user input
read_input() {
    local input
    read input
    echo $input
}

# Main function
main() {
    local nice_value=2

    while true; do
        init_terminal

        tput cup 53 0
        echo "UltraSinger GUI"

        show_ascii_art
        show_input_prompt

        input=$(read_input)

        if [[ "$input" == "quit" ]]; then
            break
        fi

        tput cup 55 0
        echo "Running UltraSinger.py with input: $input and nice value: $nice_value"

        # Run the UltraSinger Python script with nice
        nice -n $nice_value asdf exec python UltraSinger.py -i "$input" -o ~/UltraStar\ Deluxe\ Library/

        sleep 2  # Wait for a short while before restarting the loop
    done

    reset_terminal
}

# Run the main function
main

