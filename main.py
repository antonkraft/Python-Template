import logging

log_level: int = logging.DEBUG

if __name__ == "__main__":
    print("> START")

    logging.basicConfig(level=log_level, format="> %(asctime)s %(levelname)s: %(message)s")
    print("> END")
