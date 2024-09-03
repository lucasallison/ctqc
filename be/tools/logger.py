import logging
import os


class Logger:
    def __init__(self, name: str, log_file: str, log_to_terminal=False):

        self.log_file = log_file
        self.log_to_terminal = log_to_terminal

        # Create a logger
        self.logger = logging.getLogger(name)
        self.logger.setLevel(logging.DEBUG)

        # Create a file handler and set the log level
        file_handler = logging.FileHandler(log_file)
        file_handler.setLevel(logging.DEBUG)

        # Create a formatter and add it to the file handler
        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(message)s')
        file_handler.setFormatter(formatter)

        # Add the file handler to the logger
        self.logger.addHandler(file_handler)

        # Optionally add a stream handler to log to the terminal
        if log_to_terminal:
            stream_handler = logging.StreamHandler()
            stream_handler.setLevel(logging.DEBUG)
            stream_handler.setFormatter(formatter)
            self.logger.addHandler(stream_handler)

    def log(self, message, level=logging.INFO):
        if not os.path.exists(self.log_file):
            with open(self.log_file, 'a') as f:
                pass

        self.logger.log(level, message)
