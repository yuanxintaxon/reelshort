import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  Styles._();

  static MaterialColor primaryBlack = const MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  static Color c_0089FF = const Color(0xFF0089FF); // 主题色 -- deprecated
  static Color c_FFB4B4FF = const Color(0xFFB4B4FF); // 主题色 -- deprecated
  static Color c_FFA1FAFC = const Color(0xFFA1FAFC); // 主题色 -- deprecated
  static Color c_9CB4B4F3 = const Color(0x9CB4B4FF); // 主题色 -- deprecated
  static Color c_0C1C33 = const Color(0xFF0C1C33); // 黑色字体
  static Color c_8E9AB0 = const Color(0xFF8E9AB0); // 说明文字
  static Color c_E8EAEF = const Color(0xFFE8EAEF); // 分割线
  static Color c_FF381F = const Color(0xFFFF381F); // 警告色
  static Color c_FFFFFF = const Color(0xFFFFFFFF); // 警告色
  static Color c_22C127 = const Color(0xFF22C127); // 在线
  static Color c_F0F2F6 = const Color(0xFFF0F2F6); // 聊天页底部

  static Color c_92B3E0 = const Color(0xFF92B3E0);
  static Color c_F2F8FF = const Color(0xFFF2F8FF); // 同步成功背景色
  static Color c_F8F9FA = const Color(0xFFF8F9FA); // 默认背景
  static Color c_6085B1 = const Color(0xFF6085B1);
  static Color c_FFB300 = const Color(0xFFFFB300); // 会议状态
  static Color c_FFE1DD = const Color(0xFFFFE1DD); // 同步失败背景色
  static Color c_EAEAEA = const Color(0xFFEAEAEA); // border color

  static Color c_92B3E0_opacity50 = c_92B3E0.withOpacity(.5); // 气泡背景
  static Color c_E8EAEF_opacity50 = c_E8EAEF.withOpacity(.5);
  static Color c_F4F5F7 = const Color(0xFFF4F5F7);
  static Color c_CCE7FE = const Color(0xFFCCE7FE);

  // -- new --
  static Color c_000000 = const Color(0xFF000000); // 主题色 -- new
  static Color c_828282 = const Color(0xFF828282); // for gradient -- new
  static Color c_F0E6CD = const Color(0xFFF0E6CD); // 主题色 gradient 1 a -- new
  static Color c_F0E8D1 = const Color(0xFFF0E8D1); // 主题色 gradient 1 b -- new
  static Color c_F9F1D9 = const Color(0xFFF9F1D9); // 主题色 gradient 1 c -- new
  static Color c_FFEBAE = const Color(0xFFFFEBAE); // 主题色 gradient 2 a -- new
  static Color c_DFC554 = const Color(0xFFDFC554); // 主题色 gradient 2 b -- new
  static Color c_D7C990 = const Color(0xFFD7C990); // 主题色 gradient 2 c -- new
  static Color c_02A3FE = const Color(0xFF02A3FE); // 主题色 gradient 3 a -- new
  static Color c_F902FE = const Color(0x99F902FE); // 主题色 gradient 3 b -- new
  static Color c_FFEBAC = const Color(0xFFFFEBAC); // 主题色 gradient 4 a -- new
  static Color c_F0D982 = const Color(0xFFF0D982); // 主题色 gradient 4 b -- new
  static Color c_E0C655 = const Color(0xFFE0C655); // 主题色 gradient 4 c -- new
  static Color c_B08B52 = const Color(0xFFB08B52); // 主题色 gradient 5 b -- new
  static Color c_75610E = const Color(0xFF75610E); // 主题色 gradient 6 b -- new
  static Color c_E5C86C = const Color(0xFFE5C86C); // 主题色 gradient 7 a -- new
  static Color c_8C7511 = const Color(0xFF8C7511); // 主题色 gradient 7 b -- new
  static Color c_F3E7C2 = const Color(0xFFF3E7C2); // 主题色 GOLD 1 -- new -- 6 a
  static Color c_D0C285 = const Color(0xFFD0C285); // 主题色 GOLD 2 -- new
  static Color c_B09968 = const Color(0xFFB09968); // 主题色 GOLD 3 -- new
  static Color c_F3F3F3 = const Color(0xFFF3F3F3); // 默认背景
  static Color c_9F9F9F = const Color(0xFF9F9F9F); // 说明文字
  static Color c_EBEBEB = const Color(0xFFEBEBEB); // 说明文字
  static Color c_C2C2C2 = const Color(0xFFC2C2C2); // 说明文字, divider
  static Color c_8E8E8E = const Color(0xFF8E8E8E); // 说明文字
  static Color c_4E4E4E = const Color(0xFF4E4E4E); // 说明文字
  static Color c_D30000 = const Color(0xFFD30000); // 错误说明文字
  static Color c_D9D9D9 = const Color(0xFFD9D9D9); // 禁用说明文字
  static Color c_030303 = const Color(0xFF030303); // 黑色主题默认背景, 主题radical gradient 1
  static Color c_868686 = const Color(0xFF868686); // 黑色主题按钮默认背景
  static Color c_808080 = const Color(0xFF808080); // 黑色主题 border
  static Color c_747373 = const Color(0xFF747373); // 主题radical gradient 2
  static Color c_B3B3B3 = const Color(0xFFB3B3B3); // 主题subtitle
  static Color c_2E2E2E = const Color(0xFF2E2E2E); // 主题 tile 背景
  static Color c_694B12 = const Color(0xFF694B12); // 主题 special label text
  static Color c_6F6F6F = const Color(0xFF6F6F6F); // 主题 page title
  static Color c_26252B = const Color(0xFF26252B); // 主题 info panel
  static Color c_F34F67 = const Color(0xFFF34F67); // 主题 notification dot
  static Color c_F4F4F4 = const Color(0xFFF4F4F4); // 主题 comments background
  static Color c_896C29 = const Color(0xFF896C29); // 主题 comments foreground
  static Color c_FFFBEF = const Color(0xFFFFFBEF); // 主题 vip gradient border
  static Color c_806703 = const Color(0x11806703); // 主题 vip gradient border
  static Color c_979797 = const Color(0xFF979797); // 主题 subtitle
  static Color c_CBCBCB = const Color(0xFFCBCBCB); // 主题 comment
  static Color c_757575 = const Color(0xFF757575); // 主题 comment
  static Color c_CECECE = const Color(0xFFCECECE); // 主题 club callout
  static Color c_888888 = const Color(0xFF888888); // 主题 club button bg
  static Color c_CCC8B9 = const Color(0xFFCCC8B9); // 主题 signup float bg
  static Color c_DCDCDC = const Color(0xFFDCDCDC); // 主题 login float bg
  static Color c_EBC651 = const Color(0xFFEBC651); // 主题 dialog button color
  static Color c_886544 = const Color(0xFF886544); // 主题 dialog button text color
  static Color c_009229 = const Color(0xFF009229); // 主题 supported language color
  static Color c_EEC929 = const Color(0xFFEEC929); // 主题色 gradient 6 a -- new
  static Color c_D3C58A = const Color(0xFFD3C58A); // 主题色 gradient 6 b -- new
  static Color c_5E5E5E = const Color(0xFF4E4E4E); // 主题色 unsupported language color
  static Color c_F2EF91 = const Color(0xFFF2EF91); // 主题 tag cat color 1
  static Color c_F29591 = const Color(0xFFF29591); // 主题 tag cat color 2
  static Color c_91DAF2 = const Color(0xFF91DAF2); // 主题 tag cat color 3
  static Color c_91F2D0 = const Color(0xFF91F2D0); // 主题 tag cat color 4
  static Color c_90D4FF = const Color(0xFF90D4FF); // 主题 intro bubble tip, gradient 8a
  static Color c_95CFFF = const Color(0xFF95CFFF); // 主题 gradient 8b -- new
  static Color c_CA8EFF = const Color(0xFFCA8EFF); // 主题 gradient 8c -- new
  static Color c_B1AC8F = const Color(0xFFB1AC8F); // 主题 world moments
  static Color c_363636 = const Color(0xFF363636); // 主题 world moments dark theme
  static Color c_DBDBDB = const Color(0xFFDBDBDB); // 主题 world moments dark theme
  static Color c_DFCC92 = const Color(0xFFDFCC92); // check conflicts when merge
  static Color c_F9F3E1 = const Color(0xFFF9F3E1); // check conflicts when merge
  static Color c_2A2A2A = const Color(0xFF2A2A2A); // check conflicts when merge
  static Color c_DFD29F = const Color(0xFFDFD29F); // 主题 gold at subscription page
  static Color c_8D8D8D = const Color(0xFF8D8D8D); // 主题 gold at subscription page
  static Color c_FEE9A8 = const Color(0xFFFEE9A8); // 主题色 gradient 8 a -- new
  static Color c_E3C95D = const Color(0xFFE3C95D); // 主题色 gradient 8 b -- new
  static Color c_FFF5B9 = const Color(0xFFFFF5B9); // whatssapp encrypt hint bg color
  static Color c_A5A5A5 = const Color(0xFFA5A5A5); // video progress color [played]
  static Color c_464646 = const Color(0xFF464646); // video progress color [bg]
  static Color c_5D5D5D = const Color(0xFF5D5D5D); // video progress color [buffered]
  static Color c_ECECEC = const Color(0xFFECECEC); // new button grey background
  static Color c_DF1025 = const Color(0xFFDF1025); // packet gradient 9 a -- new
  static Color c_FF370C = const Color(0xFFFF370C); // packet gradient 9 b -- new
  static Color c_F7C401 = const Color(0xFFF7C401); // packet gradient 9 c -- new
  static Color c_FFE891 = const Color(0xFFFFE891); // packet gradient 9 d -- new
  static Color c_FFEFAE = const Color(0xFFFFEFAE); // packet text color -- new
  static Color c_FFC100 = const Color(0xFFFFC100); // packet text bg color -- new
  static Color c_F3BCC1 = const Color(0xFFF3BCC1); // packet primary text
  static Color c_FF9255 = const Color(0xFFFF9255); // packet primary text
  static Color c_FFCE13 = const Color(0xFFFFCE13); // packet coin border color
  static Color c_F2F3F7 = const Color(0xFFF2F3F7); // packet coin border color
  static Color c_00C920 = const Color(0xFF00C920); // bull color
  static Color c_FF8080 = const Color(0xFFFF8080); // bear color
  static Color c_ECEBF0 = const Color(0xFFECEBF0); // mine page new bg color
  static Color c_686E83 = const Color(0xFF686E83); // new secondary text
  static Color c_F3DC89 = const Color(0xFFF3DC89); // new gold button color
  static Color c_00C25F = const Color(0xFF00C25F); // earnings details btn color

  // static Color c_E8EAEF_opacity30 = c_E8EAEF.withOpacity(.3); // 默认背景\

  static Color c_FFFFFF_opacity0 = c_FFFFFF.withOpacity(.0);
  static Color c_FFFFFF_opacity70 = c_FFFFFF.withOpacity(.7);
  static Color c_FFFFFF_opacity50 = c_FFFFFF.withOpacity(.5);
  static Color c_0089FF_opacity10 = c_0089FF.withOpacity(.1);
  static Color c_0089FF_opacity20 = c_0089FF.withOpacity(.2);
  static Color c_0089FF_opacity50 = c_0089FF.withOpacity(.5);
  static Color c_FF381F_opacity10 = c_FF381F.withOpacity(.1);
  static Color c_8E9AB0_opacity13 = c_8E9AB0.withOpacity(.13);
  static Color c_8E9AB0_opacity15 = c_8E9AB0.withOpacity(.15);
  static Color c_8E9AB0_opacity16 = c_8E9AB0.withOpacity(.16);
  static Color c_8E9AB0_opacity30 = c_8E9AB0.withOpacity(.3);
  static Color c_8E9AB0_opacity50 = c_8E9AB0.withOpacity(.5);
  static Color c_0C1C33_opacity30 = c_0C1C33.withOpacity(.3);
  static Color c_0C1C33_opacity60 = c_0C1C33.withOpacity(.6);
  static Color c_0C1C33_opacity85 = c_0C1C33.withOpacity(.85);
  static Color c_0C1C33_opacity80 = c_0C1C33.withOpacity(.8);
  static Color c_FF381F_opacity70 = c_FF381F.withOpacity(.7);

  static Color c_000000_opacity0 = c_000000.withOpacity(.0);
  static Color c_000000_opacity4 = c_000000.withOpacity(.04);
  static Color c_000000_opacity5 = c_000000.withOpacity(.05);
  static Color c_000000_opacity10 = c_000000.withOpacity(.1);
  static Color c_000000_opacity12 = c_000000.withOpacity(.12);
  static Color c_000000_opacity15 = c_000000.withOpacity(.15);
  static Color c_000000_opacity20 = c_000000.withOpacity(.2);
  static Color c_000000_opacity25 = c_000000.withOpacity(.25);
  static Color c_000000_opacity38 = c_000000.withOpacity(.38);
  static Color c_000000_opacity58 = c_000000.withOpacity(.58);
  static Color c_000000_opacity50 = c_000000.withOpacity(.5);
  static Color c_000000_opacity65 = c_000000.withOpacity(.65);
  static Color c_000000_opacity70 = c_000000.withOpacity(.7);
  static Color c_000000_opacity75 = c_000000.withOpacity(.75);
  static Color c_000000_opacity85 = c_000000.withOpacity(.85);
  static Color c_000000_opacity80 = c_000000.withOpacity(.8);
  static Color c_000000_opacity88 = c_000000.withOpacity(.88);
  static Color c_000000_opacity95 = c_000000.withOpacity(.95);
  static Color c_000000_opacity100 = c_000000.withOpacity(1.0);

  static Color c_D9D9D9_opacity0 = c_D9D9D9.withOpacity(.0);
  static Color c_D9D9D9_opacity4 = c_D9D9D9.withOpacity(.04);
  static Color c_D9D9D9_opacity5 = c_D9D9D9.withOpacity(.05);
  static Color c_D9D9D9_opacity10 = c_D9D9D9.withOpacity(.1);
  static Color c_D9D9D9_opacity12 = c_D9D9D9.withOpacity(.12);
  static Color c_D9D9D9_opacity15 = c_D9D9D9.withOpacity(.15);
  static Color c_D9D9D9_opacity20 = c_D9D9D9.withOpacity(.2);
  static Color c_D9D9D9_opacity38 = c_D9D9D9.withOpacity(.38);
  static Color c_D9D9D9_opacity50 = c_D9D9D9.withOpacity(.5);
  static Color c_D9D9D9_opacity58 = c_D9D9D9.withOpacity(.58);
  static Color c_D9D9D9_opacity65 = c_D9D9D9.withOpacity(.65);
  static Color c_D9D9D9_opacity70 = c_D9D9D9.withOpacity(.7);
  static Color c_D9D9D9_opacity75 = c_D9D9D9.withOpacity(.75);
  static Color c_D9D9D9_opacity85 = c_D9D9D9.withOpacity(.85);
  static Color c_D9D9D9_opacity88 = c_D9D9D9.withOpacity(.88);
  static Color c_D9D9D9_opacity95 = c_D9D9D9.withOpacity(.95);
  static Color c_D9D9D9_opacity100 = c_D9D9D9.withOpacity(1.0);

  static Color c_95CFFF_opacity90 = c_95CFFF.withOpacity(.9);
  static Color c_CA8EFF_opacity90 = c_CA8EFF.withOpacity(.9);

  static Color c_8E8E8E_opacity30 = c_8E8E8E.withOpacity(.3);

  static Color c_FFC100_opacity25 = c_FFC100.withOpacity(.25);

  /// height
  // bottom bar height
  static double bottombar_height = 90;

  /// gradient design
  // linear
  static Gradient linear_gradient_000000_828282 = LinearGradient(
    colors: [c_000000, c_000000, c_828282],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static Gradient linear_gradient_828282_000000 = LinearGradient(
    colors: [c_828282, c_000000, c_000000],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static Gradient linear_gradient_DFC554_FFEBAE = LinearGradient(
    colors: [c_FFEBAE, c_DFC554],
    begin: Alignment.bottomLeft,
    end: Alignment.centerRight,
  );
  static Gradient linear_gradient_02A3FE_F902FE = LinearGradient(
    colors: [c_02A3FE, c_F902FE],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Gradient linear_gradient_FFFBEF_806703 = LinearGradient(
    colors: [c_FFFBEF, c_806703],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient linear_gradient_F3E7C2_75610E = LinearGradient(
    colors: [c_F3E7C2, c_75610E],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient linear_gradient_E5C86C_8C7511 = LinearGradient(
    colors: [c_E5C86C, c_8C7511],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient linear_gradient_DFCC92_F9F3E1_B09968 = LinearGradient(
    colors: [c_DFCC92, c_F9F3E1, c_B09968],
    stops: const [0.0, 0.3, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Gradient linear_gradient_FEE9A8_E3C95D = LinearGradient(
    colors: [c_FEE9A8, c_E3C95D],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static Gradient linear_gradient_DF1025_FF370C = LinearGradient(
    colors: [c_DF1025, c_FF370C],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  // radical
  static Gradient radial_gradient_030303_747373(context) => RadialGradient(
        center: const Alignment(0, 0.65),
        colors: [
          Styles.c_030303,
          Styles.c_747373,
        ],
        focalRadius: 0.2,
        // focal: Alignment.bottomCenter,
        radius: MediaQuery.of(context).size.height * 0.0035,
      );
  static Gradient radial_gradient_828282_000000 = RadialGradient(
    center: const Alignment(0, 0.65),
    colors: [
      Styles.c_030303,
      Styles.c_747373,
    ],
    focalRadius: 0.2,
    // focal: Alignment.bottomCenter,
    radius: 3,
  );

  // sweep
  static Gradient sweep_gradient_E0C655_FFEBAC = SweepGradient(
    startAngle: 5.8,
    endAngle: 13,
    tileMode: TileMode.repeated,
    center: FractionalOffset.center,
    colors: [
      Styles.c_E0C655,
      Styles.c_F0D982,
      Styles.c_FFEBAC,
    ],
    stops: const [0.4, 0.8, 1.0],
  );

  static Gradient sweep_gradient_E0C655_FFEBAC_w110 = SweepGradient(
    startAngle: 6.1,
    endAngle: 13,
    tileMode: TileMode.repeated,
    center: FractionalOffset.center,
    colors: [
      Styles.c_E0C655,
      Styles.c_F0D982,
      Styles.c_FFEBAC,
    ],
    stops: const [0.4, 0.8, 1.0],
  );

  static Gradient sweep_gradient_E0C655_FFEBAC_w125 = SweepGradient(
    startAngle: 6.125,
    endAngle: 13,
    tileMode: TileMode.repeated,
    center: FractionalOffset.center,
    colors: [
      Styles.c_E0C655,
      Styles.c_F0D982,
      Styles.c_FFEBAC,
    ],
    stops: const [0.4, 0.8, 1.0],
  );

  /// boxshadow design
  // button
  static List<BoxShadow> box_shadow_btn = [
    BoxShadow(
      color: Styles.c_000000.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 4),
    )
  ];
  // switch
  static List<BoxShadow> box_shadow_switch = [
    BoxShadow(
      color: Styles.c_000000.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 2),
    )
  ];
  // circular button
  static List<BoxShadow> box_shadow_circular_btn = [
    BoxShadow(
      color: Styles.c_000000.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(2, 5),
    )
  ];
  // avatar
  static List<BoxShadow> box_shadow_avatar = [
    BoxShadow(
      color: Styles.c_000000.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 4),
    )
  ];
  // loading
  static List<BoxShadow> box_shadow_loading_box = [
    BoxShadow(
      color: Styles.c_000000.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 2,
      offset: const Offset(0, 2),
    )
  ];

  /// border
  // input border
  static InputBorder prompt_input_border = OutlineInputBorder(
    borderSide: BorderSide(color: Styles.c_8E8E8E, width: 0.2),
    borderRadius: BorderRadius.circular(2),
  );

  static List<BoxShadow> box_shadow_chat_input = [
    BoxShadow(
      color: Styles.c_000000_opacity5, // Specify the shadow color
      offset: const Offset(1, 1), // Specify the offset of the shadow
      blurRadius: 10.0, // Specify the blur radius
      spreadRadius: 0.0, // Specify the spread radius
    )
  ];

  /*
  GoogleFonts.montserrat(
    textStyle: ,
  );
  */

  /// static constant default text style
  static const defaultStyle =
      TextStyle(fontFamilyFallback: ['Apple Color Emoji']);

  /// Archivo Narrow for explore page hot club name
  // 000000
  static TextStyle ts_000000_20sp_regular_archivo_narrow =
      GoogleFonts.archivoNarrow(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_regular_archivo_narrow =
      GoogleFonts.archivoNarrow(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_bold_archivo_narrow =
      GoogleFonts.archivoNarrow(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  // CECECE
  static TextStyle ts_CECECE_12sp_regular_archivo_narrow =
      GoogleFonts.archivoNarrow(
    textStyle: TextStyle(
      color: c_CECECE,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // 8E8E8E
  static TextStyle ts_8E8E8E_14sp_regular_archivo_narrow =
      GoogleFonts.archivoNarrow(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// Inter for world page caption text
  // 000000
  static TextStyle ts_000000_32sp_semibold_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_regular_inter_lh1half = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_medium_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_regular_inter_lh1half = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_light_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  // FFFFFF
  static TextStyle ts_FFFFFF_20sp_regular_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_regular_inter_lh1half = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ).merge(defaultStyle);
  // D0C285
  static TextStyle ts_D0C285_20sp_regular_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_D0C285,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // 8E8E8E
  static TextStyle ts_8E8E8E_12sp_regular_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // 886544
  static TextStyle ts_886544_16sp_regular_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_886544,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // EBC651
  static TextStyle ts_EBC651_16sp_regular_inter = GoogleFonts.inter(
    textStyle: TextStyle(
      color: c_EBC651,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// Mohave for world page caption text
  /// 8E8E8E
  static TextStyle ts_8E8E8E_12sp_regular_mohave = GoogleFonts.mohave(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// Abril Fatface for floating badge
  /// 694B12
  static TextStyle ts_694B12_16sp_regular_abril_fatface =
      GoogleFonts.abrilFatface(
    textStyle: TextStyle(
      color: c_694B12,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_694B12_14sp_regular_abril_fatface =
      GoogleFonts.abrilFatface(
    textStyle: TextStyle(
      color: c_694B12,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_694B12_10sp_regular_abril_fatface =
      GoogleFonts.abrilFatface(
    textStyle: TextStyle(
      color: c_694B12,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// ABeeZee for subscription
  /// 000000
  static TextStyle ts_000000_12sp_regular_abeezee = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_12sp_regular_abeezee_lh1half = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ).merge(defaultStyle);

  /// 8D8D8D
  static TextStyle ts_8D8D8D_12sp_regular_abeezee = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_12sp_regular_abeezee_lh1half = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ).merge(defaultStyle);

  /// Montserrat for registration and login
  // 000000
  static TextStyle ts_000000_36sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 36,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_medium_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_regular_lh2_montserrat =
      GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 2,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_medium_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_semibold_ls5_montserrat =
      GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 5.0,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_semibold_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_medium_ls2_montserrat =
      GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // FFFFFF
  static TextStyle ts_FFFFFF_46sp_bold_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 46,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_40sp_light_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 40,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_22sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFFF_20sp_medium_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_20sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_semibold_ls5_montserrat =
      GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 5.0,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // F3E7C2
  static TextStyle ts_F3E7C2_96sp_black_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_F3E7C2,
      fontSize: 96,
      fontWeight: FontWeight.w900,
    ),
  ).merge(defaultStyle);
  // C2C2C2
  static TextStyle ts_C2C2C2_22sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_20sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_14sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // 8E8E8E
  static TextStyle ts_8E8E8E_22sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_20sp_regular_lh2_montserrat =
      GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 2,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_20sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_16sp_semibold_ls5_montserrat =
      GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 5.0,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_14sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // 4E4E4E
  static TextStyle ts_4E4E4E_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_4E4E4E,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // D30000
  static TextStyle ts_D30000_20sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D30000_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // D9D9D9
  static TextStyle ts_D9D9D9_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_D9D9D9,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D9D9D9_14sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_D9D9D9,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  // cat
  static TextStyle ts_F29591_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_F29591,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_F2EF91_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_F2EF91,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_91DAF2_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_91DAF2,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_91F2D0_16sp_regular_montserrat = GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: c_91F2D0,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// Noto Sans Condensed for explore club search
  /// 000000
  static TextStyle ts_000000_16sp_regular_noto_sans_condensed = TextStyle(
    fontFamily: 'NotoSansCondensedRegular',
    color: c_000000,
    fontSize: 16,
  ).merge(defaultStyle);
  // 000000
  static TextStyle ts_000000_14sp_light_noto_sans_condensed = TextStyle(
    fontFamily: 'NotoSansCondensedLight',
    color: c_000000,
    fontSize: 14,
  ).merge(defaultStyle);

  /// Noto Sans for App body content
  /// 000000
  static TextStyle ts_000000_32sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_32sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_24sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_bold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_22sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_bold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_regular_shadow = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      shadows: const [
        Shadow(
          offset: Offset(1, 1),
          blurRadius: 2.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
        ),
      ],
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_20sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_17sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_17sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_17sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_bold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_bold_lh2 = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 2,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_16sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_14sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_12sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_10sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_10sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 10,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_10sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_10sp_regular_underline = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_000000_10sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_000000,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// FFFFFF
  static TextStyle ts_FFFFFF_30sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_22sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_22sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_22sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_21sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 21,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_20sp_bold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_20sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_20sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_20sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_20sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_ffffff_20sp_regular_shadow = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      shadows: const [
        Shadow(
          offset: Offset(1, 1),
          blurRadius: 2.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
        ),
      ],
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_18sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_18sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 18,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_opacity70_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF_opacity70,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_17sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_17sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_18sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_medium_shadow = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      shadows: const [
        // Shadow(
        //   offset: Offset(1, 1),
        //   blurRadius: 2.0,
        //   color: Color.fromRGBO(0, 0, 0, 0.25),
        // ),
        Shadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 10.0,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ],
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_16sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_opacity70_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF_opacity70,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_14sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_opacity70_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF_opacity70,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_12sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_12sp_regular_lh1half = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_12sp_shadow = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 12,
      shadows: const [
        Shadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 50.0,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ],
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_10sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 10,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_10sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_10sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFFFFF_10sp_light_shadow = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFFFFF,
      fontSize: 10,
      fontWeight: FontWeight.w300,
      shadows: const [
        Shadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 10.0,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ],
    ),
  ).merge(defaultStyle);

  /// 9F9F9F
  static TextStyle ts_9F9F9F_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_9F9F9F,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_9F9F9F_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_9F9F9F,
      fontSize: 12,
    ),
  ).merge(defaultStyle);

  /// 8E9AB0
  static TextStyle ts_8E9AB0_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_opacity50_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0_opacity50,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_16sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 16,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_15sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 15,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_13sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 13,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_10sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E9AB0_10sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E9AB0,
      fontSize: 10,
    ),
  ).merge(defaultStyle);

  /// 0C1C33
  static TextStyle ts_0C1C33_20sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_20sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_20sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 20,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_17sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_17sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_14sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_12sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0C1C33_10sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0C1C33,
      fontSize: 10,
    ),
  ).merge(defaultStyle);

  /// 0089FF
  static TextStyle ts_0089FF_22sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_17sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_17sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_16sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 16,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_14sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_10sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_0089FF_10sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_0089FF,
      fontSize: 10,
    ),
  ).merge(defaultStyle);

  /// FF381F
  static TextStyle ts_FF381F_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FF381F,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FF381F_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FF381F,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FF381F_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FF381F,
      fontSize: 12,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FF381F_10sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FF381F,
      fontSize: 10,
    ),
  ).merge(defaultStyle);

  /// D0C285
  static TextStyle ts_D0C285_20sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D0C285,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D0C285_16sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D0C285,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 6085B1
  static TextStyle ts_6085B1_17sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6085B1,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6085B1_17sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6085B1,
      fontSize: 17,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6085B1_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6085B1,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6085B1_14sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6085B1,
      fontSize: 14,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6085B1_12sp = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6085B1,
      fontSize: 12,
    ),
  ).merge(defaultStyle);

  /// 8E8E8E
  static TextStyle ts_8E8E8E_22sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_22sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_20sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_16sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_12sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8E8E8E_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8E8E8E,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// B3B3B3
  static TextStyle ts_B3B3B3_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B3B3B3,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B3B3B3_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B3B3B3,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B3B3B3_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B3B3B3,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B3B3B3_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B3B3B3,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 6F6F6F
  static TextStyle ts_6F6F6F_26sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6F6F6F,
      fontSize: 26,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6F6F6F_24sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6F6F6F,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6F6F6F_22sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6F6F6F,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6F6F6F_20sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6F6F6F,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6F6F6F_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6F6F6F,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_6F6F6F_16sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_6F6F6F,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// 694B12
  static TextStyle ts_694B12_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_694B12,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_694B12_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_694B12,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 979797
  static TextStyle ts_979797_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_979797,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);

  /// CBCBCB
  static TextStyle ts_CBCBCB_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_CBCBCB,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_CBCBCB_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_CBCBCB,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 896C29
  static TextStyle ts_896C29_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_896C29,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_896C29_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_896C29,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 757575
  static TextStyle ts_757575_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_757575,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_757575_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_757575,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_757575_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_757575,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 808080
  static TextStyle ts_808080_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_808080,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_808080_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_808080,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// B09968
  static TextStyle ts_B09968_20sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B09968,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B09968_20sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B09968,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B09968_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B09968,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B09968_16sp_regular_strikethrough = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B09968,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B09968_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B09968,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_B09968_16sp_regular_underline = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B09968,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    ),
  ).merge(defaultStyle);

  /// D30000
  static TextStyle ts_D30000_22sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D30000_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D30000_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D30000_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_D30000_12sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D30000,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// 009229
  static TextStyle ts_009229_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_009229,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// 5E5E5E
  static TextStyle ts_5E5E5E_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_5E5E5E,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_5E5E5E_16sp_regular_italic = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_5E5E5E,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_5E5E5E_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_5E5E5E,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);

  /// 22C127
  static TextStyle ts_22C127_10sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_22C127,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// B1AC8F
  static TextStyle ts_B1AC8F_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B1AC8F,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  static TextStyle ts_B1AC8F_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_B1AC8F,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// DBDBDB
  static TextStyle ts_DBDBDB_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_DBDBDB_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_DBDBDB_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_DBDBDB_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_DBDBDB_12sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_DBDBDB_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_DBDBDB_12sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DBDBDB,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// C2C2C2
  static TextStyle ts_C2C2C2_22sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_20sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_17sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_C2C2C2_16sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_C2C2C2,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// D9D9D9
  static TextStyle ts_D9D9D9_22sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_D9D9D9,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// transparent
  static TextStyle ts_transparent_22sp_regular = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      color: Colors.transparent,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_transparent_14sp_regular = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      color: Colors.transparent,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// DFD29F
  static TextStyle ts_DFD29F_16sp_regular_italic = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DFD29F,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    ),
  ).merge(defaultStyle);

  /// 8D8D8D
  static TextStyle ts_8D8D8D_16sp_bold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_14sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_14sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_8D8D8D_12sp_light = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_8D8D8D,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
  ).merge(defaultStyle);

  /// EBC651
  static TextStyle ts_EBC651_14sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_EBC651,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// A5A5A5
  static TextStyle ts_A5A5A5_20sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_A5A5A5,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// DF1025
  static TextStyle ts_DF1025_32sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_DF1025,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);

  /// FFEFAE
  static TextStyle ts_FFEFAE_24sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFEFAE,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFEFAE_20sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFEFAE,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFEFAE_16sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFEFAE,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_FFEFAE_16sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FFEFAE,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// F3BCC1
  static TextStyle ts_F3BCC1_20sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3BCC1,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_F3BCC1_16sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3BCC1,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_F3BCC1_12sp_semibold = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3BCC1,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_F3BCC1_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3BCC1,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_F3BCC1_10sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3BCC1,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// FF9255
  static TextStyle ts_FF9255_12sp_regular = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_FF9255,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ).merge(defaultStyle);

  /// c_F3F3F3
  static TextStyle ts_F3F3F3_16sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3F3F3,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
  static TextStyle ts_F3F3F3_12sp_medium = GoogleFonts.notoSans(
    textStyle: TextStyle(
      color: c_F3F3F3,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ).merge(defaultStyle);
}
