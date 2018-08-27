Name:           demo2
Version:       	1 
Release:        1%{?dist}
Summary:       	just a demo package 

License:        GPL
Source0:       	demo2-1.tar.gz 
BuildArch:      noarch

%description


%prep
%setup -q




%install
mkdir -p $RPM_BUILD_ROOT/home/vagrant/demo/helloworld/polls
install -m 755 views.py  $RPM_BUILD_ROOT/home/vagrant/demo/helloworld/polls/views.py

%files
/*
%doc



%changelog
