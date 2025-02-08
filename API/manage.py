import os
import sys


def main():

    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Tutorials.settings")
    try:
        from django.core.management import execute_from_command_line
        from django.core.management.commands.runserver import Command as runserver

        runserver.default_port = os.getenv("DJANGO_SERVER_PORT", "8000")
        runserver.default_addr = os.getenv("DJANGO_SERVER_HOST", "127.0.0.1")
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == "__main__":
    main()
