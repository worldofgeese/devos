{ ... }: {
  users.users.root.openssh.authorizedKeys.keyFiles =
    [ ../../secrets/worldofgeese.pub ];
}
