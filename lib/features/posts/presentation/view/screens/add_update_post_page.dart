import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utls/snackbar_message.dart';
import 'package:posts_app/core/widgets/app_bar_widget.dart';
import 'package:posts_app/core/widgets/text_formfield_widget.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/manager/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/add_update_post_page/add_or_update_bt.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_page/loading_widget.dart';

class AddUpdatePostPage extends StatefulWidget {
  const AddUpdatePostPage({super.key, required this.isUpdate, this.post});
  final bool isUpdate;
  final Post? post;
  @override
  State<AddUpdatePostPage> createState() => _AddUpdatePostPageState();
}

final _formKey = GlobalKey<FormState>();
final titleController = TextEditingController();
final bodyController = TextEditingController();

class _AddUpdatePostPageState extends State<AddUpdatePostPage> {
  @override
  void initState() {
    titleController.text = widget.isUpdate ? widget.post!.title ?? "" : "";
    bodyController.text = widget.isUpdate ? widget.post!.body ?? "" : "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.isUpdate ? "Update Post" : "Add Post"),
      body: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
        listener: (context, state) {
          if (state is MessageAddDeleteUpdatePostState) {
            SnackbarMessage().showSnackBarSuccess(state.message, context);
            Navigator.pop(context);
          }
          if (state is ErrorAddDeleteUpdatePostState) {
            SnackbarMessage().showSnackBarError(state.erroMessage, context);
          }
        },
        builder: (context, state) {
          if (state is LoadingAddDeleteUpdatePostState) {
            return Center(child: LoadingWidget());
          }
          return _builBody();
        },
      ),
    );
  }

  _builBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormfieldWidget(
                controller: titleController,
                title: "Title",
                isMaltiLines: false),
            SizedBox(height: 15),
            TextFormfieldWidget(
                controller: bodyController, title: "Body", isMaltiLines: true),
            SizedBox(height: 30),
            AddOrUpdateBt(
                isUpdate: widget.isUpdate, onPressed: () => _addorUpdate())
          ],
        ),
      ),
    );
  }

  _addorUpdate() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      context.read<AddDeleteUpdatePostBloc>().add(widget.isUpdate
          ? UpdatePostEvent(Post(
              id: widget.post!.id,
              title: titleController.text,
              body: bodyController.text))
          : AddPostEvent(
              Post(title: titleController.text, body: bodyController.text)));
    }
  }
}
