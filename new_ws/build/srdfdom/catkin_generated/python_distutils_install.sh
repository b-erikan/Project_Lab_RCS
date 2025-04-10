#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/src/srdfdom"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/lib/python3/dist-packages:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/srdfdom/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/srdfdom" \
    "/usr/bin/python3" \
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/src/srdfdom/setup.py" \
    egg_info --egg-base /home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/srdfdom \
    build --build-base "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/srdfdom" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" --install-scripts="/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/bin"
