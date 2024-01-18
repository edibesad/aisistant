import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class OneShotState extends Equatable {
  const OneShotState(
      {this.isLoading = false,
      this.message = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada enim nec vestibulum maximus. In hac habitasse platea dictumst. Donec erat nunc, efficitur non euismod in, efficitur id odio. Pellentesque ipsum enim, molestie nec nunc vehicula, venenatis tincidunt nisi. Etiam porta eget dui quis suscipit. Proin purus dolor, dignissim eget hendrerit aliquet, bibendum non urna. Morbi lobortis eleifend lorem vel aliquet. Ut vestibulum odio et nisi vehicula viverra. Praesent nec libero aliquam, mollis quam gravida, efficitur ipsum. Nunc luctus odio in congue molestie.

Quisque nec volutpat purus. Nulla quis eros mi. Nulla at sodales ex. Donec sodales elit eros, ut pharetra eros rutrum vitae. Nulla sollicitudin nisl cursus, rhoncus ante vitae, viverra arcu. Nullam posuere elit et commodo lobortis. Nullam iaculis leo non velit dignissim dapibus. Nam sed turpis ut mi iaculis vulputate. Etiam sit amet dolor lacinia diam rutrum lacinia. Praesent ac nibh eu tellus convallis consectetur a et quam.

Proin eu est sed purus finibus tempus. Etiam sit amet semper justo. Etiam pellentesque viverra porttitor. Nullam condimentum sem placerat, pharetra odio at, dapibus ex. Curabitur dapibus enim id sem malesuada eleifend. Vestibulum bibendum diam nulla, id iaculis quam commodo sit amet. Ut feugiat dui in massa aliquam hendrerit. Donec quis tortor massa. Cras sodales varius porttitor. Nullam turpis magna, egestas et dapibus nec, fermentum sit amet nulla. Aenean ac metus eu lorem vehicula tempus. Ut at lobortis sem. Integer id erat et augue condimentum euismod in at magna. Etiam ultricies consequat vehicula. Vestibulum tempus auctor neque in maximus.

Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec cursus nulla sed ex iaculis, at ornare nisl efficitur. Duis a risus porttitor, elementum turpis non, mattis neque. Sed sed risus sed sem venenatis vehicula ut quis metus. Nam convallis ut eros id feugiat. Vestibulum malesuada accumsan tellus, vel tincidunt lacus faucibus ut. Fusce sed ante ut eros mattis euismod eu lacinia nisi.

Aliquam sed turpis vitae ante egestas maximus. Praesent erat erat, malesuada vel lobortis nec, tempor in massa. Suspendisse luctus interdum enim ac congue. Nulla eleifend maximus euismod. In laoreet tortor eu odio feugiat commodo. Pellentesque a eleifend eros, quis porta orci. Nulla at accumsan augue. Curabitur eleifend ipsum sem, a molestie urna suscipit sed. Sed hendrerit cursus est sit amet imperdiet. Aliquam erat volutpat. Fusce libero justo, faucibus sed sem sit amet, tristique lacinia turpis. Ut maximus ornare fermentum. Nulla rhoncus tempus felis, a pharetra eros condimentum in. Integer fringilla ut diam quis tristique.

 """});
  final bool isLoading;
  final String message;

  @override
  List<Object?> get props => [isLoading, message];

  OneShotState copyWith({
    bool? isLoading,
    String? message,
  }) {
    return OneShotState(
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message);
  }
}
