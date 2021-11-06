
function generate_word {
  chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefjhijklnmopqrstuvwxyz0123456789!?@._-
  STR=""
    for i in {1..8} ; do
      STR+="${chars:RANDOM%${#chars}:1}"
    done
}

generate_word
echo "New generation: '$STR'"