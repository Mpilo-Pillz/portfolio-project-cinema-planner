class HttpError extends Error {
  message;
  errorCode;

  constructor(message, errorCode) {
    this.message = message;
    this.errorCode = errorCode;

    super(message);
  }
}

module.exports = HttpError;
