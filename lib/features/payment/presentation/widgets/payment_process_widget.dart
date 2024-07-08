import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ticket_mobile/core/enums/payment_type_enum.dart';
import 'package:ticket_mobile/core/helpers/snackbar_helper.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/strings.dart';
import 'package:ticket_mobile/core/validators/form_validators.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/ask_payment_param_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_entity.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_state.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_state.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_event.dart';
import 'package:ticket_mobile/features/shared/models/payment_method_item_data.dart';
import 'package:ticket_mobile/features/shared/widgets/bottom_sheet_draggable_indicator_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/button_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/custom_dropdown_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/error_reload_button_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/input_field_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_method_widget.dart';

class PaymentProcessWidget extends StatefulWidget {
  const PaymentProcessWidget({
    required this.userMember,
    required this.onPressed,
    required this.context,
    super.key,
  });

  final VoidCallback onPressed;
  final BuildContext context;
  final UserMemberEntity userMember;

  static void showPaymentProcess({
    required BuildContext context,
    required VoidCallback onPressed,
    required UserMemberEntity userMember,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            10.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext _) {
        return Scaffold(
          body: PaymentProcessWidget(
            onPressed: onPressed,
            context: context,
            userMember: userMember,
          ),
        );
      },
    );
  }

  @override
  State<PaymentProcessWidget> createState() => _PaymentProcessWidegtState();
}

class _PaymentProcessWidegtState extends State<PaymentProcessWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<QuotaMapEntity> _quotaMap = [];
  QuotaMapEntity? _selectedQuota;
  bool _hasError = false;
  PaymentMethodItemData? _selectedPaymentMethod;

  void _onSubmit() {
    if (_formKey.currentState!.saveAndValidate()) {
      final String quantity =
          _formKey.currentState!.value['quantity'].toString();
      context.read<AskPaymentBloc>().add(
            AskPaymentRequested(
              askPaymentParam: AskPaymentParamEntity(
                memberId: widget.userMember.id,
                paymentType: PaymentType.fromString(
                  _selectedPaymentMethod?.value ?? '',
                ),
                quota: QuotaParamEntity(
                  periodicity: _selectedQuota?.periodicity ?? '',
                  quantity: int.parse(
                    quantity,
                  ),
                ),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size kDeviceSize = MediaQuery.of(context).size;
    return Container(
      height: kDeviceSize.height * 0.8,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomSheetDraggableIndicator(),
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              height: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      regularizefee,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => widget.context.pop(),
                      icon: const Icon(
                        Icons.close,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                BlocConsumer<GetMapSofPaymentBloc, GetMapSofPaymentState>(
                  listener:
                      (BuildContext context, GetMapSofPaymentState state) {
                    debugPrint('------- State ------- ');
                    debugPrint(state.toString());
                    if (state is GetMapSofPaymentFailed) {
                      setState(
                        () {
                          _hasError = true;
                        },
                      );
                    }
                    if (state is GetMapSofPaymentSuccess) {
                      debugPrint('------ Success ------- ');
                      setState(
                        () {
                          _quotaMap = state.maps.quotamaps;
                          _hasError = false;
                        },
                      );
                    }
                  },
                  builder: (BuildContext context, GetMapSofPaymentState state) {
                    return Skeletonizer(
                      enabled: state is GetMapSofPaymentLoading,
                      child: _hasError
                          ? Center(
                              child: ErrorReloadButtonWidget(
                                onTap: () {
                                  context.read<GetMapSofPaymentBloc>().add(
                                        GetMapSofPaymentRequested(),
                                      );
                                },
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormBuilder(
                                  key: _formKey,
                                  child: InputFieldWidget(
                                    formKey: _formKey,
                                    label: amount,
                                    name: 'quantity',
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                    inputEmptyValidationText: requiredField,
                                    validatorMode:
                                        FormValidatorMode.nullOrEmpty,
                                    inputInvalidValidationText: validAmount,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        FormValidator.positiveRegex,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomDropdownWidget(
                                  onSelected: (quota) {
                                    setState(
                                      () {
                                        _selectedQuota = quota;
                                      },
                                    );
                                  },
                                  quotaMaps: _quotaMap,
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text(
                                  paymentMethods,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                PaymentMethodWidget(
                                  onSelected: (paymentMethod) {
                                    setState(
                                      () {
                                        _selectedPaymentMethod = paymentMethod;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BlocConsumer<AskPaymentBloc,
                                        AskPaymentState>(
                                      listener: (BuildContext context,
                                          AskPaymentState state) {
                                        debugPrint('----- Payment State -----');
                                        debugPrint(state.toString());

                                        if (state is AskPaymentFailed) {
                                          SnackBarHelper.showSnackBar(
                                            context: context,
                                            message: state.message,
                                          );
                                        }
                                        if (state is AskPaymentSuccess) {
                                          // Reload the payment list on the home screen
                                          context
                                              .read<GetPaymentBloc>()
                                              .add(GetPaymentRequested());

                                          SnackBarHelper.showSnackBar(
                                            context: context,
                                            isSuccess: true,
                                            boldText: paymentDone,
                                            message: paymentSuccessful,
                                          );
                                          widget.context.pop();
                                        }
                                      },
                                      builder: (BuildContext context,
                                          AskPaymentState state) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: ButtonWidget(
                                                text: continueTo,
                                                isLoading:
                                                    state is AskPaymentLoading,
                                                isEnable:
                                                    _selectedPaymentMethod !=
                                                            null &&
                                                        _selectedQuota != null,
                                                backgroundColor:
                                                    ColorTheme.primaryColor,
                                                onPressed: _onSubmit,
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
