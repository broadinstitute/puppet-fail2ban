require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe 'fail2ban::action' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge( { :ipaddress => '10.42.42.42' } )
      end

      let(:title) { 'fail2ban::action' }

      describe 'Test action define is called with no options' do
        let(:params) { { :actionname => 'sample1' } }
        let(:expected) do
    "# Managed by Puppet
# Module: fail2ban

[INCLUDES]


[Definition]


[Init]
"
        end

        it { should contain_file('sample1.local').with_path('/etc/fail2ban/action.d/sample1.local').with_content(expected) }
      end

       describe 'Test action.local is created with all options' do
         let(:params) { {
           :actionname     => 'sample2',
           :actionstart    => 'start_action',
           :actionstop     => 'stop_action',
           :actioncheck    => 'check_action',
           :actionban      => ['first_ban_action','second_ban_action','complex[ban]'],
           :actionunban    => 'now_unban',
           :actionbefore   => 'add_before',
           :actioninitvars => ['a = 1','b = 2', 'not c'],
         } }
         let(:expected) do
    "# Managed by Puppet
# Module: fail2ban

[INCLUDES]

before = add_before
[Definition]

actionstart = start_action
actionstop = stop_action
actioncheck = check_action
actionban = first_ban_action
\tsecond_ban_action
\tcomplex[ban]
actionunban = now_unban

[Init]
a = 1
b = 2
not c
"
         end

         it { should contain_file('sample2.local').with_path('/etc/fail2ban/action.d/sample2.local').with_content(expected) }
         it { should contain_file('sample2.local').without_source }
       end

       describe 'Test action define is called with a source file' do
        let(:params) { {
          :actionname   => 'sample3',
          :actionsource => 'puppet:///some/path/to/source',
        } }

        it { should contain_file('sample3.local').with_path('/etc/fail2ban/action.d/sample3.local').with_source('puppet:///some/path/to/source') }
        it { should contain_file('sample3.local').without_template }
      end

    end
  end
end
