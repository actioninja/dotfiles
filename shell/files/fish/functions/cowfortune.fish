function cowfortune --wraps='fortune -a | cowsay | lolcat -b'
  fortune -a | cowsay | lolcat -b
end
