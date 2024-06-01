<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'test' );

/** Database username */
define( 'DB_USER', 'admin' );

/** Database password */
define( 'DB_PASSWORD', 'Hai204fromtheocean' );

/** Database hostname */
define( 'DB_HOST', 'cos40006-codedeploy-rds.cwgruczxadko.us-east-1.rds.amazonaws.com' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'PX6ZI-=`$!$l#nEW,ky,ioPVT|tdNx(*KFUj-Zlu!#rRI00[SnvSU*EJF+)o?hnh' );
define( 'SECURE_AUTH_KEY',  'Cv]@Dqe u3=rU^ych<46,i3w(YD,UgwF0W^Yqc1E2@Vo@yHVO);em%oi(<eY?f}.' );
define( 'LOGGED_IN_KEY',    ' T55m+XW^MJVj< )n@N+P3g }.%@de@i)4#IoHaw?oLSXsa94bB(n2cOPKwEvCSM' );
define( 'NONCE_KEY',        '43zN[T#>3koqFfo/R0J/{%twix%<f:Gpx]Ib~&wT2h-,Wd{LI`FWqNRO#N(WzQMr' );
define( 'AUTH_SALT',        '!z6J71YWmeicS8`~*Ju0.8qCC2(?__y4pWhSqZrYyu=_]7m~_01hUy}a},NcbEN&' );
define( 'SECURE_AUTH_SALT', '4CUg.R:d(4sJ~xW v/cUko+73v%9Y9QO;M9nn]2 mpX=>Ea*W)24~J(EPEV2VDV5' );
define( 'LOGGED_IN_SALT',   'flXC#c.ewalroKxeiN3y`Ygd( %lKy`$;~,W#2PH!ca2k0~,TxHisvsB+Yz/P}J<' );
define( 'NONCE_SALT',       'PuAEB%|veirQ<f]O%a#ROk=?[VCLO{~j};0}4LOWY2Mj9{:YaP1#GKi: Q/hwP{W' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
