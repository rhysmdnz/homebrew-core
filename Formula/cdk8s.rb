require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.10.tgz"
  sha256 "a7201b080153b41750611b7958e2ea23f1b59d99ccaed3e378a6719a378bdb70"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9f02393955464bdc861605918c5897a94fd0284a3617afc25000934adffbcc0e"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
