final Map<String, String> errorMessages = {
  'user-not-found': 'The provided email address is not registered.',
  'wrong-password': 'The password is incorrect. Please try again.',
  'email-already-in-use':
      'The email address is already in use by another account.',
  'invalid-email':
      'The email address is not valid. Please check and try again.',
  'user-disabled':
      'This user account has been disabled. Please contact support.',
  'operation-not-allowed':
      'This operation is not allowed. Please contact support.',
  'weak-password':
      'The password is too weak. Please choose a stronger password.',
  'too-many-requests': 'Too many attempts. Please try again later.',
  'network-request-failed':
      'Network error. Please check your internet connection and try again.',
  'requires-recent-login':
      'This operation requires recent authentication. Please log in again.',
  'invalid-credential': 'The credential provided is malformed or has expired.',
  'invalid-verification-code':
      'The verification code is invalid. Please try again.',
  'session-expired': 'Your session has expired. Please log in again.',
  'internal-error': 'An internal error has occurred. Please try again later.',
  'missing-email': 'An email address must be provided.',
  'missing-password': 'A password must be provided.',
  'missing-phone-number': 'A phone number must be provided.',
  'invalid-phone-number':
      'The phone number is invalid. Please check the number and try again.',
};

class UserFriendlyException implements Exception {
  final String message;
  const UserFriendlyException({required this.message});
}


String getErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return 'The email address you entered is invalid.';
    case 'user-disabled':
      return 'The user account you entered has been disabled.';
    case 'user-not-found':
      return 'The email address you entered does not correspond to an existing user.';
    case 'wrong-password':
      return 'The password you entered is incorrect.';
    case 'too-many-requests':
      return 'There have been too many attempts to sign in. Please try again later.';
    case 'operation-not-allowed':
      return 'This operation is not allowed. Please contact support.';
    case 'weak-password':
      return 'The password you entered is too weak.';
    case 'email-already-in-use':
      return 'The email address you entered is already in use.';
    case 'account-exists-with-different-credential':
      return 'An account already exists with the same email address but different sign-in credentials. Please login with the appropriate provider.';
    case 'invalid-credential':
      return 'The credential you entered is invalid.';
    default:
      return 'An unknown error occurred. Please try again later.';
  }
}
