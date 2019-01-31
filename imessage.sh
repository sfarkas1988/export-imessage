if [ $# -lt 1 ]; then
    echo "Enter a iMessage account (email or phone number i.e +33616.....) "
fi

sqlite3 ~/Library/Messages/chat.db "
select is_from_me,text from message where handle_id=(
select handle_id from chat_handle_join where chat_id=(
select ROWID from chat where guid='iMessage;-;$1')
)" | sed 's/1\|/me: /g;s/0\|/budy: /g' > MessageBackup.txt
