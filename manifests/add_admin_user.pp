class osx_management::add_admin_user {
  # Create a variable for the password based on the OS Version
  # All the password hashes represent the same password - 'puppet'
  $password = $macosx_productversion_major ? {
    '10.7' => 'bd21ecea1ab32f28401ad8124fa032b041db266c4ae5fd86d0f8b9a8da603dc7e49ae58a50b31c509882f01195d565e8e7ee67a10f0259244965a11e991e840849d7fdfb',
    '10.8' => '6bff6d8917f9f067499c1728377a3d8440a91b696e870916f66491c4830e1fb2ef80d25a65f41d8b50c8590054c4a40540ddd03dbfb866bb151c1650a549b68924cad60e757b0ac7305939aa80f7ef70c7a778ba66913e0534295648af6dcc56fdf34f16b1ca5d04f2ec856378cc0ad1ba8e1f9767a3f5c8515bd5d82b687930',
    default => '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000EB8B2BDB24EE6148B31D0A07044BB0EF065E824CE53224400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  }

  # Do a user declaration and use the variable set above
  user { 'padmin':
  	ensure     => 'present',
  	comment    => 'Puppet Admin',
  	gid        => '20',
  	home       => '/Users/padmin',
  	password   => $password,
  	shell      => '/bin/bash',
  	uid        => '550',
  }
}