function cowfortune --wraps='fortune -a | cowsay | lolcat -t'
  set the_fortune "You're missing fortune, so instead I'm just here to look nice."
  if command -q fortune
    set the_fortune (fortune -a)
  end
  echo $the_fortune | cowsay | lolcat -t
end
