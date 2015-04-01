#!/bin/bash

#Start tmux session with

tmux new-session  -d 'bash'
tmux move-window -t 1
if [ -f ./Gemfile ]; 
	then
		tmux new-window -n 'console' 'rails console --sandbox' 
		tmux move-window -t 2
		tmux new-window -n 'server' 'rails s' 
		tmux move-window -t 3
fi
if [ -f ./Guardfile ]; 
	then
		tmux new-window -n 'guard' 'bundle exec guard'
		tmux move-window -t 4
fi
tmux select-window -t 1
tmux -2 attach-session -d
