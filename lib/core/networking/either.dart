// abstract class Either<Failure, Response> {
//   const Either();
//   T fold<T>(
//     T Function(Response data) rightFn,
//     T Function(Failure error) leftFn,
//   );
// }

// class Left<Failure, Response> extends Either<Failure, Response> {
//   final Failure value;
//   const Left(this.value);

//   @override
//   T fold<T>(
//     T Function(Response data) rightFn,
//     T Function(Failure error) leftFn,
//   ) {
//     return leftFn(value);
//   }
// }

// class Right<Failure, Response> extends Either<Failure, Response> {
//   final Response value;
//   const Right(this.value);

//   @override
//   T fold<T>(
//     T Function(Response data) rightFn,
//     T Function(Failure error) leftFn,
//   ) {
//     return rightFn(value);
//   }
// }
