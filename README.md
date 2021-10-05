# Legend Design Template

A sample Project using the Legend Design Kit. This aims to be a Template for every Platform. 



## Layouts
The LegendScaffold which is the base for each page can be used with three different Layout Types.

### FixedHeader

### FixedHeaderSider

### FixedSider


## Theming
The *LegendColorTheme* and *LegendSizingTheme* are provided through the *LegendTheme* class to the whole Application using Provider. This way the theme can be changed at runtime. 

### Color Schema
For the Color schema the object *LegendColorTheme* is used. Here all Colors can specified. Different Themes can be implemented very fast just with adding a new b Object to the *LegendTheme* class. 

### Sizing
For Sizing Widgets the object *LegendSizingTheme* is used. Values for Paddings, Margins, Font Size and TouchSize can be specific to each Platform. For Example for the Mobile and Desktop / Web Platforms.


## Legend Colors
A class with preconfigured Colors for every use case. The Colors itself are stored as static const.


## Sizes
For providing information on size the inherted Widget *SizeProvider* is used. This widget sits close to the top of the widget tree. This Class contains variables for *width* and *height* and methods used for *Layout*.




## Routing
Custom Routing using the Navigator 2.0 API which supports Web. *RouterProvider* provides static Methods for pushing Pages. It gets initalized with your List of prefered Routes (*RouteInfo* Object) and MenuOptions (*MenuOptionHeader* Object). The Layout components *FixedSider* and *FixedHeader* will display these MenuOptions accordingly to your selected Layout.

### Pages

### Sections
Section Navigation Information is stored in the  *SectionProvider*. Foreach Section in your Page a Global key is stored, aswell as name and route. *SectionNavigation* is a inhertied Widget which provides methods. The Aninimation is made using the prebuilt method *Scrollable.ensureVisible* and is built into *LegendScaffold*.

### Modal
Modal Routes are realized with a Stack on the very top of the page. 


## Typography

## Custom Widgets

### Data Display

### Input

### Layout

### Decoration



## Utils


