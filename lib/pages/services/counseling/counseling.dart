import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';

const content = """
We offer counseling services to help you get the most out of our product. 
Our team of experienced UI designers and developers can provide guidance on how to use our framework effectively, as well as help you design and implement a UI that meets the needs of your target audience.
Whether you're a small startup or a large corporation, our UI framework and counseling services can help you save time and resources while delivering a top-quality user experience.
Contact us today to learn more and see how we can help your cross-platform app succeed.
""";

class CounsellingPage extends LegendWidget {
  const CounsellingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, theme) {
    return LegendRouteBody(
      disableContentDecoration: false,
      builder: (context, s) => LegendText(
        style: theme.typography.h1,
        content,
      ),
    );
  }
}
