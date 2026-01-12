String errorMessages(String error) {
  switch (error) {
    // Authentication errors
    case 'User.NotFound':
      return 'User not found. Please check your credentials and try again.';

    case 'User.InvalidCredentials':
      return 'Email or password is incorrect';

    case 'User.InvalidJwtToken':
      return 'Your session has expired. Please log in again.';

    case 'User.InvalidGoogleToken':
      return 'Google login failed. Please try again.';

    case 'User.InvalidRefreshToken':
      return 'Your session has expired. Please log in again.';

    case 'User.DuplicatedEmail':
      return 'This email is already registered. Please use another one.';

    case 'User.EmailNotConfirmed':
      return 'Please confirm your email before logging in.';

    case 'User.InvalidCode':
      return 'The code you entered is invalid.';

    case 'User.DuplicatedConfirmation':
      return 'Your email is already confirmed.';

    // Connection & timeout errors
    case 'Timeout error, please try again later':
      return 'The request timed out. Please try again later.';

    case 'Connection error, please check your internet connection':
      return 'No internet connection. Please check your network and try again';

    case 'Request was cancelled':
      return 'The request was cancelled. Please try again.';

    default:
      return error;
  }
}
