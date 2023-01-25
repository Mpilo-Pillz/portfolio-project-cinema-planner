class HttpError extends Error {
  message;
  errorCode;

  constructor(message, errorCode) {
    super(message);
    this.message = message;
    this.errorCode = errorCode;

  }
}

module.exports = HttpError;
