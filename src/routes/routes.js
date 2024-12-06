import DashboardLayout from '../layout/DashboardLayout.vue'
// GeneralViews
import NotFound from '../pages/NotFoundPage.vue'

// Admin pages
import Overview from 'src/pages/Overview.vue'
import UserProfile from 'src/pages/UserProfile.vue'
import TableList from 'src/pages/TableList.vue'
import Typography from 'src/pages/Typography.vue'
import Icons from 'src/pages/Icons.vue'
import Maps from 'src/pages/Maps.vue'
import Notifications from 'src/pages/Notifications.vue'
import Upgrade from 'src/pages/Upgrade.vue'
///Paginas de componentes 
import Agencias from 'src/pages/Agencias.vue'
import Departamentos from 'src/pages/Departamentos.vue'
import Areas from '../pages/Areas.vue'
import Categorias from '../pages/Categorias.vue'
import Marcas from '../pages/Marcas.vue'
import Modelos from '../pages/Modelos.vue'
import Monitores from '../pages/Monitores.vue'
import SistemaOperativo from '../pages/SistemaOperativo.vue'
import Procesadores from '../pages/Procesadores.vue'
import DiscoDuro from '../pages/DiscoDuro.vue'
import Ram from '../pages/Ram.vue'
import Antivirus from '../pages/Antivirus.vue'
import Office from '../pages/Office.vue'
import Login from '../Login.vue';
import ModuloControlGeneral from '../pages/ModuloControlGeneral.vue'
import DeptoArea from '../pages/DeptoArea.vue'

import Administradores from '../pages/Administradores.vue'

const routes = [
  {
    path: '/', // Ruta inicial
    redirect: '/login', // Redirige al login
  },
  {
    path: '/login', // Ruta para el login
    name: 'Login',
    component: Login,
  },
  {
    path: '/admin',
    component: DashboardLayout,
    redirect: '/admin/panel',
    children: [
      {
        path: 'panel',
        name: 'panel',
        component: Overview
      },
      {
        path: 'user',
        name: 'User',
        component: UserProfile
      },
      {
        path: 'mantenimiento',
        name: 'Mantenimiento',
        component: TableList
      },
      {
        path: 'equipos',
        name: 'equipos',
        component: Typography
      },
      {
        path: 'datosgenerales',  // Cambié la ruta base a 'icons'
        name: 'datosgenerales',
        component: Icons,
      },
      {
        path: 'agencias',  // Cambié la ruta base a 'icons'
        name: 'Agencias',
        component: Agencias,
      },
      {
        path: 'departamentos',  // Cambié la ruta base a 'icons'
        name: 'Departamentos',
        component: Departamentos,
      },
      {
        path: 'areas',  // Cambié la ruta base a 'icons'
        name: 'Areas',
        component: Areas,
      },
      {
        path: 'categorias',  // Cambié la ruta base a 'icons'
        name: 'Categorias',
        component: Categorias,
      },
      {
        path: 'marcas',  // Cambié la ruta base a 'icons'
        name: 'Marcas',
        component: Marcas,
      },
      {
        path: 'modelos',  // Cambié la ruta base a 'icons'
        name: 'Modelos',
        component: Modelos,
      },
      {
        path: 'monitores',  // Cambié la ruta base a 'icons'
        name: 'Monitores',
        component: Monitores,
      },
      {
        path: 'sistemaoperativo',  // Cambié la ruta base a 'icons'
        name: 'SistemaOperativo',
        component: SistemaOperativo,
      },
      {
        path: 'procesadores',  // Cambié la ruta base a 'icons'
        name: 'Procesadores',
        component: Procesadores,
      },
      {
        path: 'discoduro',  // Cambié la ruta base a 'icons'
        name: 'DiscoDuro',
        component: DiscoDuro,
      },
      {
        path: 'ram',  // Cambié la ruta base a 'icons'
        name: 'Ram',
        component: Ram,
      },
      {
        path: 'antivirus',  // Cambié la ruta base a 'icons'
        name: 'Antivirus',
        component: Antivirus,
      },
      {
        path: 'office',  // Cambié la ruta base a 'icons'
        name: 'Office',
        component: Office,
      },
      {
        path: 'administradores',  // Cambié la ruta base a 'icons'
        name: 'Administradores',
        component: Administradores,
      },
      
      {
        path: 'deptoarea',  // Cambié la ruta base a 'icons'
        name: 'DeptoArea',
        component: DeptoArea,
      },
      {
        path: 'admin',
        name: 'admin',
        component: Maps
      },
      {
        path: 'notifications',
        name: 'Notifications',
        component: Notifications
      },
      {
        path: 'upgrade',
        name: 'Upgrade to PRO',
        component: Upgrade
      }
    ]
  },
  { path: '*', component: NotFound }
]

/**
 * Asynchronously load view (Webpack Lazy loading compatible)
 * The specified component must be inside the Views folder
 * @param  {string} name  the filename (basename) of the view to load.
function view(name) {
   var res= require('../components/Dashboard/Views/' + name + '.vue');
   return res;
};**/

export default routes
