FromDevice(eth0)->mainclass::Counter->main::Classifier(12/0800,-);
main[0]->main0::Counter->ipclass1::IPClassifier(src host 10.10.10.10, 
                   src host 10.10.10.11, 
                   src host 10.10.10.12, 
                   src host 10.10.10.13,
                   src host 10.10.10.14,
   		    -);
main[1] -> ToHost();
aaqm::AAQM;
ipclass1[0] -> class1::Counter->SetIPDSCP(3)-> before0::Counter->[0]aaqm;
ipclass1[1] -> class2::Counter->SetIPDSCP(7)-> before1::Counter->[1]aaqm;
ipclass1[2] -> class3::Counter->SetIPDSCP(11)->before2::Counter->[2]aaqm;
ipclass1[3] -> class4::Counter->SetIPDSCP(15)->before3::Counter->[3]aaqm;
ipclass1[4] -> class5::Counter->SetIPDSCP(19)->before4::Counter->[4]aaqm;
ipclass1[5] -> class6::Counter->ToHost;



d_rr::RoundRobinSched;

aaqm[0]->after0::Counter->[0]d_rr;
aaqm[1]->after1::Counter->[1]d_rr;
aaqm[2]->after2::Counter->[2]d_rr;
aaqm[3]->after3::Counter->[3]d_rr;
aaqm[4]->after4::Counter->[4]d_rr;


t1::PullTee;
d_rr -> rr_count::Counter->Shaper(200)->[0]t1[1]->tee_counter::Counter->ToHost;
t1[0]->tee_dis::Counter->Discard;
