require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe 'fail2ban::filter' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge( { :ipaddress => '10.42.42.42' } )
      end

      let(:title) { 'fail2ban::filter' }

      describe 'Test filter define is called with no options' do
        let (:params) { { :filtername => 'sample1' } }
        let(:expected) do
    "# Managed by Puppet
# Module: fail2ban

[INCLUDES]


[Definition]

failregex =
ignoreregex =


[Init]

"
        end

        it { should contain_file('sample1.local').with_path('/etc/fail2ban/filter.d/sample1.local').with_content(expected) }
      end

       describe 'Test filter.local is created with all options' do
         let (:params) { {
           :filtername           => 'sample2',
           :filterfailregex      => ['first_fail_regex','second_fail_regex','complex[filter]'],
           :filterignoreregex    => 'now_ignore',
           :filterbefore         => 'add_before',
           :filterdefinitionvars => ['a = 1','b = 2', 'not c'],
         } }
         let(:expected) do
    "# Managed by Puppet
# Module: fail2ban

[INCLUDES]

before = add_before
[Definition]

failregex = first_fail_regex
\tsecond_fail_regex
\tcomplex[filter]
ignoreregex = now_ignore

a = 1
b = 2
not c

[Init]

"
         end

         it { should contain_file('sample2.local').with_path('/etc/fail2ban/filter.d/sample2.local').with_content(expected) }
         it { should contain_file('sample2.local').without_source }
       end

       describe 'Test filter define is called with a source file' do
        let (:params) { {
          :filtername   => 'sample3',
          :filtersource => 'puppet:///some/path/to/source',
        } }

        it { should contain_file('sample3.local').with_path('/etc/fail2ban/filter.d/sample3.local').with_source('puppet:///some/path/to/source') }
        it { should contain_file('sample3.local').with_content(nil) }
        it { should contain_file('sample3.local').without_template }
      end

    end
  end
end
