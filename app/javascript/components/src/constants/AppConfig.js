/**
 * App Config File
 */
const AppConfig = {
  appLogo: '/assets/static/img/site-logo.png', // App Logo
  brandName: 'HoyTrabajas', // Brand Name
  navCollapsed: true, // Sidebar collapse
  darkMode: false, // Dark Mode
  boxLayout: false, // Box Layout
  rtlLayout: false, // RTL Layout
  miniSidebar: false, // Mini Sidebar
  enableSidebarBackgroundImage: false, // Enable Sidebar Background Image
  sidebarImage: '/assets/static/img/sidebar-4.jpg', // Select sidebar image
  isDarkSidenav: true, // Set true to dark sidebar
  enableThemeOptions: false, // Enable Theme Options
  locale: {
    languageId: 'spanish',
    locale: 'es',
    name: 'Spanish',
    icon: 'es'
  },
  enableUserTour: process.env.NODE_ENV === 'production', // Enable / Disable User Tour
  copyRightText: 'HoyTrabajas © 2019 Todos los derechos reservados', // Copy Right Text
  // light theme colors
  themeColors: {
    primary: '#ff8100',
    secondary: '#00a8b5',
    success: '#00D014',
    danger: '#FF3739',
    warning: '#FFB70F',
    info: '#00D0BD',
    dark: '#464D69',
    default: '#FAFAFA',
    greyLighten: '#A5A7B2',
    grey: '#677080',
    white: '#FFFFFF',
    purple: '#896BD6',
    yellow: '#D46B08'
  },
  // dark theme colors
  darkThemeColors: {
    darkBgColor: '#424242'
  }
}

export default AppConfig
