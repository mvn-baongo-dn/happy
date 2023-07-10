import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy/data/models/common/responses/localeLanguage.dart';
import 'package:happy/utilities/extensions/extensions.dart';

import '../../routes/app_router.dart';
import './bloc/language_selection_module.dart';
import './bloc/language_selection_presenter.dart';
import './bloc/language_selection_state.dart';
import '../../core/base_page/base_page.dart';
import 'components/item_language_choose.dart';
import 'components/item_language.dart';
import 'components/item_title.dart';

/// Create at:   28/06/2023
/// Page:        [LanguageSelectionPage]
/// Module:      [LanguageSelectionModule]
/// Presenter:   [LanguageSelectionPresenter]
/// State:       [LanguageSelectionState]
/// Description:
/// TODO: This is [LanguageSelectionPage]
///
@RoutePage()
class LanguageSelectionPage extends BasePage {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState
    extends BasePageState<LanguageSelectionPage, LanguageSelectionPresenter> {
  @override
  void onInitState() {
    super.onInitState();
    _initPage();
  }

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => Color(0xFFF2F2F6);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF2F2F6),
        title: const Text(
          'Chọn ngôn ngữ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      );

  @override
  Widget buildBody(BuildContext context) =>
      BlocBuilder<LanguageSelectionPresenter, LanguageSelectionState>(
        bloc: presenter,
        buildWhen: (previous, current) => previous.language != current.language,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemTitle(
                    text: 'NGÔN NGỮ',
                  ),
                  ItemLanguageChoose(
                    text: state.language.name,
                    onTap: () => _onPressLanguage(),
                  ),
                  ItemTitle(text: 'LỰA CHỌN NGÔN NGỮ'),
                  SizedBox(
                    height: 10,
                  ),
                  ..._buildListLanguage(state),
                ],
              ),
            ),
          );
        },
      );

  List<Widget> _buildListLanguage(LanguageSelectionState state) {
    return List.generate(
      state.localeLanguage.length,
      (index) => ItemLanguage(
        onTap: () => _onPressItem(state.localeLanguage[index]),
        text: state.localeLanguage[index].name,
      ),
    );
  }

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}

///==========================================================================///
///=> Behavior of the [LanguageSelectionPage]
///==========================================================================///
extension _LanguageSelectionPageBehavior on _LanguageSelectionPageState {
  void _onPressItem(LocaleLanguage localeLanguage) {
    presenter.chooseLanguage(localeLanguage);
  }

  void _onPressLanguage() {
    presenter
        .setLanguage()
        .subscribeHandleError(
          this,
        )
        .subscribeOnSuccess(
          this,
          success: _handleCheckingTokenSuccess,
        );
    AutoRouter.of(context).replace(
      const HomeRoute(),
    );
  }

  _handleCheckingTokenSuccess(void data) {
    AutoRouter.of(context).replace(
      const HomeRoute(),
    );
  }

  void _initPage() {
    presenter.initLocal();
  }
}
