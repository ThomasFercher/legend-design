import 'package:flutter/widgets.dart';
import 'package:legend_design_core/libraries/scaffold.dart';

const content = """
Are you struggling to keep up with the demands of software development in-house? At [Company Name], we offer development as a service to help you bring your ideas to life without the hassle of managing a development team.

Our team of experienced developers can handle everything from initial concept development to the final stages of deployment. We use the latest technologies and methodologies to ensure that your project is delivered on time and to the highest quality standards.

But we don't just stop at development. We also offer a range of related services, such as project management, quality assurance, and maintenance. This ensures that your project is well-coordinated and supported from start to finish.

Whether you need a custom software solution for your business or are looking to bring a new product to market, our development as a service can help you achieve your goals. Contact us today to learn more and see how we can help your project succeed.
""";

const content2 = """
At Legend Design, we offer a range of services to help bring your software development ideas to life. For smaller projects, we offer fixed price templates that provide a cost-effective and efficient solution. These templates are pre-designed and customizable, allowing you to quickly get started and launch your project.

For more advanced ideas and projects, we offer development as a service. Our team of experienced developers can handle everything from initial concept development to the final stages of deployment. We use the latest technologies and methodologies to ensure that your project is delivered on time and to the highest quality standards.

In addition to development, we also offer a range of related services, such as project management, quality assurance, and maintenance. This ensures that your project is well-coordinated and supported from start to finish.

Whether you need a custom software solution for your business or are looking to bring a new product to market, Legend Design has the expertise and resources to help you achieve your goals. Contact us today to learn more and see how we can help your project succeed.
""";

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LegendRouteBody(
      builder: (context, s) => Container(
        child: Text(
          content,
        ),
      ),
    );
  }
}
