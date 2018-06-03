#!/bin/bash
base_dir=$(dirname $(dirname $0))
cd $base_dir

# run django
python manage.py runserver 0.0.0.0:8001 &
# run VUE
npm run dev --prefix fe/ &
# run django Celery
# PYTHONOPTIMIZE=1 python manage.py celery worker --loglevel=info  -f log/celery.log &

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
wait
