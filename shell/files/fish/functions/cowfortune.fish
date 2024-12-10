function cowfortune --wraps='fortune -a | cowsay | lolcat -t'
  fortune -a | cowsay | lolcat -t
end
