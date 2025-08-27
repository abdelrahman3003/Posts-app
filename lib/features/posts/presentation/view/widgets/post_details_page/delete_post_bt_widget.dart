import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/theme/app_styles.dart';
import 'package:posts_app/core/utls/snackbar_message.dart';
import 'package:posts_app/features/posts/presentation/manager/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/view/screens/posts_page.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_details_page/delete_dialog_widget.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_page/loading_widget.dart';

class DeletePostBtWidget extends StatelessWidget {
  const DeletePostBtWidget({super.key, required this.postId});
  final int postId;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _showDeleteDialog(context),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.red),
      ),
      label: Text("Delete",
          style: AppTextStyles.style16Regular.copyWith(color: AppColors.white)),
      icon: Icon(
        Icons.update,
        color: Colors.white,
      ),
    );
  }

  _showDeleteDialog(BuildContext dialoContext) {
    return showDialog(
      context: dialoContext,
      builder: (_) =>
          BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
        listener: (context, state) {
          if (state is MessageAddDeleteUpdatePostState) {
            SnackbarMessage().showSnackBarSuccess(state.message, context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => PostsPage(),
              ),
              (route) => false,
            );
          }
          if (state is ErrorAddDeleteUpdatePostState) {
            SnackbarMessage().showSnackBarError(state.erroMessage, context);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is LoadingAddDeleteUpdatePostState) {
            return AlertDialog(
              title: Center(
                child: LoadingWidget(),
              ),
            );
          }
          return DeleteDialogWidget(postId: postId);
        },
      ),
    );
  }
}
