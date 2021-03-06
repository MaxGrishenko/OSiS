#!/bin/bash
field=(- - - - - - - - -)
team="o"

while true
do
  clear
  # Отобразить, чей ход
  if [ $team == "o" ]; then
    echo "-=Ходят нолики=-"
  else
    echo "-=Ходят крестики=-"
  fi
  # Отобразить игровое поле
  echo "${field[6]}|${field[7]}|${field[8]}"
  echo "${field[3]}|${field[4]}|${field[5]}"
  echo "${field[0]}|${field[1]}|${field[2]}"

  # Совершить ход
  while true
  do
      echo "Номер клетки:"
      read turn
      # Проверяем правильность ввода
      if ((turn >= 0 && turn <= 9)); then

        # Проверяем на запись в файл
        if (( $turn == 0 )); then
          echo -e "Ход: $team \n${field[6]}|${field[7]}|${field[8]}\n${field[3]}|${field[4]}|${field[5]}\n${field[0]>          echo "Произошла запись в файл!"
          continue
        fi

        turn=$((turn-1))
        # Проверяем незанятость клетки
        if [ ${field[turn]} == "-" ]; then
          field[turn]=$team
          break
        else
          echo "Ошибка: Клетка занята!"
        fi
      else
        echo "Ошибка: Некорректный ввод (1-9)!"
      fi
  done

  # Проверить на победу
  if [[ ${field[0]} == $team && ${field[1]} == $team && ${field[2]} == $team ]] ||
     [[ ${field[3]} == $team && ${field[4]} == $team && ${field[5]} == $team ]] ||
     [[ ${field[6]} == $team && ${field[7]} == $team && ${field[8]} == $team ]] ||

     [[ ${field[0]} == $team && ${field[3]} == $team && ${field[6]} == $team ]] ||
     [[ ${field[1]} == $team && ${field[4]} == $team && ${field[7]} == $team ]] ||
     [[ ${field[2]} == $team && ${field[5]} == $team && ${field[8]} == $team ]] ||

     [[ ${field[0]} == $team && ${field[4]} == $team && ${field[8]} == $team ]] ||
     [[ ${field[2]} == $team && ${field[4]} == $team && ${field[6]} == $team ]]; then
    clear
    echo "Победила команда: $team"
    echo "${field[6]}|${field[7]}|${field[8]}"
    echo "${field[3]}|${field[4]}|${field[5]}"
    echo "${field[0]}|${field[1]}|${field[2]}"
    break
  fi

  # Передать ход
  if [ $team == "o" ]; then
    team="x"
  else
    team="o"
  fi
done