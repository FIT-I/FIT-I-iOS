//
//  ClauseViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/08.
//

import UIKit

import SnapKit

class ClauseViewController: UIViewController {

    var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "이용약관"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    lazy var textView1 : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.customColor(.darkGray)
        textView.text = """
< Fit-i >('Fit-i '이하 'Fit-i ')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

○ 이 개인정보처리방침은 2021년 12월 30부터 적용됩니다.

제1조(개인정보의 처리 목적)< Fit-i  >('Fit-i '이하 'Fit-i ')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

홈페이지 회원가입 및 관리 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지 목적으로 개인정보를 처리합니다.

재화 또는 서비스 제공 서비스 제공, 콘텐츠 제공, 맞춤서비스 제공, 본인인증을 목적으로 개인정보를 처리합니다.

마케팅 및 광고에의 활용 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.

- *제2조(개인정보의 처리 및 보유 기간)**① <Fit-i >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

1.<서비스 회원가입 및 관리> <서비스 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<1년>까지 위 이용목적을 위하여 보유.이용됩니다. 보유근거 : 회사는 서비스를 제공하는 동안 개인정보 취급방침 및 관련법에 의거하여 회원의 개인정보를 지속적으로 관리 및 보관합니다. 탈퇴 등으로 인해 개인정보 수집 및 이용목적이 달성될 경우, 수집된 개인정보는 즉시 파기됩니다. 관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 < Fit-i  >은(는)는 이용자들의 개인정보를 제2조 개인정보의 처리목적에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 해당 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. ① 이용자들이 사전에 공개에 동의한 경우

② 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

- *제3조(개인정보의 제3자 제공)**① < Fit-i  >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

② < Fit-i >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.

< Amazon Web Service > 개인정보를 제공받는 자 : Amazon Web Service 제공받는 자의 개인정보 이용목적 : 서비스 데이터베이스 제공받는 자의 보유.이용기간: 1년 **제4조(개인정보처리 위탁)**① < Fit-i >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. ② < Fit-i  >은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.

제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법) ① 정보주체는 Fit-i  대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다. ② 제1항에 따른 권리 행사는 Fit-i 에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 Fit-i 은(는) 이에 대해 지체 없이 조치하겠습니다. ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. ⑥ Fit-i 은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.

제6조(처리하는 개인정보의 항목 작성) ① <Fit-i  >은(는) 다음의 개인정보 항목을 처리하고 있습니다. • 1< 홈페이지 회원가입 및 관리 > • 필수항목 : 이메일, 비밀번호

제7조(개인정보의 파기) ① < Fit-i  > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.1. 법령 근거 :2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차< Fit-i  > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < Fit-i  > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다. 2. 파기방법 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.

제8조(개인정보의 안전성 확보 조치)< Fit-i  >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.

정기적인 자체 감사 실시개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.2. 개인정보 취급 직원의 최소화 및 교육개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.3. 개인정보의 암호화이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.4. 접속기록의 보관 및 위변조 방지개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.5. 개인정보에 대한 접근 제한개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다. 제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항) Fit-i  은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.

제10조 (개인정보 보호책임자) ① Fit-i  은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. • ▶ 개인정보 보호책임자 • 성명 :Fit-i  개인정보센터 • 직책 :책임자 • 직급 :책임자 • 연락처 :010-6686-5237, skydh1214@naver.com ※ 개인정보 보호 담당부서로 연결됩니다. • ▶ 개인정보 보호 담당부서 • 부서명 : 플랫폼 운영 • 담당자 : 김동현 • 연락처 : 010-6686-5237, skydh1214@naver.com ② 정보주체께서는 Fit-i  의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. Fit-i (는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.

제11조(개인정보 열람청구)정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.< Fit-i  >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. • ▶ 개인정보 열람청구 접수·처리 부서 • 부서명 : 플랫폼 운영 • 담당자 : 김동현 • 연락처 : 010-6686-5237, skydh1214@naver.com

- *제12조(권익침해 구제방법)**정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 ([www.kopico.go.kr)2](http://www.kopico.go.kr%292/). 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)3. 대검찰청 : (국번없이) 1301 ([www.spo.go.kr)4](http://www.spo.go.kr%294/). 경찰청 : (국번없이) 182 (cyberbureau.police.go.kr)「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회([www.simpan.go.kr](http://www.simpan.go.kr/)) 홈페이지를 참고하시기 바랍니다.

제13조(개인정보 처리방침 변경) 이 개인정보처리방침은 2021년 12월 30부터 적용됩니다. **

Fit-i  소프트웨어 사용자 라이선스 계약(EULA)

앱의 일반 사용 조건 2.1 범위 이 최종 사용자 사용권 계약(" EULA ")은 사용자(즉, 이 EULA에 동의하는 개인)가 사용자의 스마트폰(" 장치 ")에서 앱을 다운로드하고 사용하기 위한 조건을 규정합니다. 이 EULA는 동일한 목적으로 사용자가 동의한 이전 계약 또는 조건을 대체합니다. " 앱 "이라는 용어는 이 EULA의 조항에 따라 Apple iOS 및 Android OS 장치 및 동일한 업그레이드에서 사용되는 "Fit-i "로 알려진 Fit-i 의 소프트웨어 응용 프로그램을 의미합니다. 2.2 앱 다운로드 및 본 EULA 동의 앱은 장치 제조업체 또는 응용 프로그램 배포 회사(이하 " 스토어 ")가 제공하는 스토어를 통해 사용자가 다운로드할 수 있습니다. 앱을 다운로드하고 클릭하여 앱을 열면 이 EULA가 표시됩니다. 앱에 액세스하고 서비스를 사용하려면 사용자는 "동의하고 계속하기" 상자 또는 그러한 목적으로 표시될 수 있는 동등한 상자를 클릭해야 합니다. 이러한 상자를 클릭함으로써 사용자는 본 EULA(여기에 명시된 보증 및 책임 제한 포함)의 내용을 수락하고 그 내용을 이행할 것을 약속합니다. 따라서 사용자는 해당 상자를 클릭하고 앱에 액세스하기 전에 이 EULA를 주의 깊게 읽고 검토해야 합니다.

2.3 사용 허가 조건 2.3.1. 수수료. 앱의 다운로드 및 사용은 사용자가 해당 통신 네트워크에 액세스하기 위해 지불해야 하는 연결 요금을 침해하지 않고 무료입니다. 따라서 사용자는 앱을 사용할 때 해당 모바일 네트워크 공급자와의 계약 조건이 계속 적용됨을 인정합니다. 결과적으로 사용자는 앱 및/또는 서비스에 액세스하는 동안 연결 기간 동안 네트워크 연결 서비스에 대한 액세스에 대해 모바일 네트워크 공급자로부터 요금을 청구할 수 있습니다. Fit-i 는 앱 및/또는 서비스의 전체 또는 일부의 다운로드 및/또는 사용에 적절하다고 판단되는 고려 사항을 향후 도입할 권리가 있습니다. 이 경우 살토는 해당 약관을 사전에 이용자에게 충분히 통지합니다. 2.3.2. 사용 허가. 이 EULA에 따라 그리고 동일한 조건에 따라 Fit-i 는 사용자에게 앱 사용에 대한 로열티 프리, 개인, 비상업, 양도 불가능, 취소 가능, 제한적이고 비독점적인 라이선스를 부여합니다. 액세스 전용 앱에 액세스하고 Fit-i가 결정하는 기능 및 서비스에 액세스하고 사용하기 위해 앱을 통해 사용할 수 있도록 합니다. 이러한 라이선스는 섹션 2.2에 명시된 텔레매틱스 수락 메커니즘에 따라 사용자가 본 EULA를 수락한 후에 독점적으로 부여되고 사용할 수 있습니다. 언급된 앱의 허용된 사용에는 기기에서 사용, 다운로드, 실행 및 표시할 목적으로만 앱을 전체 또는 부분적으로 복제하는 것이 포함됩니다. 2.3.3. 앱 또는 서비스에 대한 무단 액세스. 위에서 부여한 라이선스는 개인용이며 양도할 수 없습니다. 사용자는 승인되지 않은 사람이 해당 장치에서 앱 및/또는 서비스에 액세스할 수 없도록 해야 하는 사용자의 장치에서 앱 및/또는 서비스를 사용할 책임이 있습니다. 또는 앱이 설치된 장치의 오용). 사용자는 앱에서 사용자 프로필을 사용하여 발생하는 모든 조치에 대해 전적인 책임을 지며 Fit-i및/또는 사용자에게 위치에 대한 모바일 액세스 권한을 부여한 시스템 소유자에 대해 모든 손해에 대해 책임을 집니다. 사용자의 장치에서 앱 및/또는 서비스의 오용 또는 부적절한 사용으로 인해 발생합니다. 사용자가 장치에서 앱 또는 서비스의 제3자에 의한 손실, 도난 또는 오용의 존재를 감지하거나 의심하는 경우 사용자는 사용자에게 모바일 액세스 권한을 부여한 시스템 소유자에게 통지할 전적인 책임이 있습니다. 후자가 적절하다고 판단하는 조치를 취할 수 있도록(특히 해당 장치에서 모바일 액세스 권한 취소 포함) 2.3.4. 사용이 허용되지 않습니다. 앱의 허용된 사용은 이전 섹션 2.3.2에 설명된 사용으로 제한됩니다. 다른 다른 목적으로의 사용은 명시적으로 금지되며 지적 및 산업 재산권 법률을 위반하는 소프트웨어 불법 복제 행위로 간주됩니다. Fit-i는 해당 법률에 따라 이 조항의 위반에 대한 책임을 요청할 권리가 있습니다. 목적을 제한하지 않고 사용자는 제3자가 (i) 앱의 사본을 만들고 배포하거나, (ii) 복사, 복제, 변경, 조작, 수정, 역엔지니어링, 분해, 디컴파일, 앱 양도, 교환 또는 번역, (iii) 모든 종류의 앱 파생물 생성, (iv) 승인되지 않은 사람이 앱 또는 서비스에 액세스하거나 사용하도록 허용, (v) 라이선스, 재 라이선스 부여, 판매, 앱 또는 앱 또는 서비스에 액세스하고 사용할 수 있는 권한을 재판매, 이전, 할당, 배포 또는 상업적으로 악용하는 행위, (vi) 불법, 불법, 사기 또는 유해한 방식으로 앱 또는 서비스를 사용하거나 불법적, 불법적, 사기적 또는 유해한 목적이나 활동에 연결하거나 이를 수행하거나 제3자의 권리를 침해하는 목적으로 수행하고, (vii) 손해를 일으키거나 유발할 수 있는 방식으로 앱 또는 서비스를 사용 앱 또는 서비스 또는 가용성 손상 또는 앱 또는 서비스의 접근성. 또한 사용자는 Fit-i또는 Fit-i그룹의 다른 회사의 경쟁자이거나 앱 또는 서비스의 가용성, 보안, 성능 또는 기능을 모니터링하거나 기타 벤치마킹을 위해 앱이나 서비스를 사용해서는 안 됩니다. 또는 경쟁 목적. 2.3.5. 지적 재산권 및 산업 재산권. 전체 앱, 즉 앱을 구성하는 모든 요소(텍스트, 이미지, 상표, 로고, 소프트웨어 파일, 색상 조합 등), 콘텐츠의 구조 선택 및 순서, 기본 소스 코드는 지적 및 산업적 보호를 받습니다. 사용자가 이를 이용, 복제, 배포, 수정, 공개적으로 전달, 할당 또는 변형할 수 있는 권한이 없으며, Fit-i가 명시적으로 승인하지 않은 다른 유형의 배포를 수행할 권한도 없습니다. 앱과 앞서 언급한 모든 요소(소스 코드 포함)에 대한 모든 지적 재산권은 독점적으로 Fit-i및/또는 해당 라이선스 제공자에게 있습니다. 앱 또는 서비스에 대한 사용자의 액세스는 허용된 경우를 제외하고 앱, 앱의 콘텐츠, 서비스 또는 기본 소스 코드에 대한 소유권 또는 기타 유형의 권리를 사용자에게 부여하지 않습니다. 섹션 2.3.2에 명시된 앱 및 서비스의 사용. Fit-i는 사용자가 지적 또는 산업 재산권을 위반하는 경우 사용자에 대해 법적 조치를 취할 권리를 보유합니다. 2.3.6. 변경 및 업데이트. Fit-i는 사용자의 허가 없이 그리고 사용자가 어떤 종류의 배상을 받을 자격도 없이 자체 재량에 따라 언제든지 앱을 수정 또는 업데이트하거나 서비스의 기술 설정을 변경할 수 있는 권리를 보유합니다. 이러한 수정 사항과 이에 대한 지적 및 산업적 재산권은 독점적으로 Fit-i에 속합니다. 또한 이러한 수정 사항은 자동으로 본 EULA의 적용을 받고 적용되는 것으로 간주됩니다. 2.3.7. 시스템 요구 사항. 앱은 Apple iOS 또는 Android 운영 체제를 실행하는 장치에서 사용할 수 있습니다. 그러나 앱을 사용하려면 사용자는 호환되는 장치, 인터넷 액세스 및 필요한 최소 사양(iOS 및 Android OS의 해당 버전 포함)이 있어야 앱을 다운로드하기 전에 참조할 수 있습니다. 스토어에서 사용할 수 있는 앱 정보(" 소프트웨어 요구 사항 "). 사용자는 앱 사용(설치 포함)으로 인해 사용자 장치에 발생할 수 있는 모든 손상 및 손실을 가정하고 앱이 사용자 장치와 호환되고 해당 장치가 소프트웨어 요구 사항을 충족하는지 확인할 단독 책임이 있습니다. 또한 사용자는 앱 및/또는 서비스의 일부 기능이 사용자 장치의 특성으로 인해 완전히 작동하지 않을 수 있음을 인정합니다. 2.3.8. 유효성. Fit-i는 앱을 항상 사용할 수 있도록 합당한 노력을 기울일 것이지만, Fit-i는 100% 가용성을 보장하지 않습니다. 사용자는 앱이 인터넷 및 모바일 네트워크를 통해 제공되므로 앱의 품질과 가용성이 Fit-i의 합리적인 통제 범위를 벗어난 요인에 의해 영향을 받을 수 있음을 인정합니다. 또한, 사용자는 앱 및 Access Mobile Services가 제대로 작동하기 위해 (i) 관련 위치의 액세스 제어 시스템의 하드웨어가 완벽한 상태와 적절한 수리 상태에 있어야 하며, (ii) 해당 위치의 시스템 소유자는 섹션 2.2의 규정에 따라 위치에 대한 모바일 액세스 권한을 사용자에게 적절하게 부여해야 합니다. 둘 다 Fit-i의 통제 밖입니다. 따라서 Fit-i는 목적을 제한하지 않고 앱이나 서비스를 사용할 수 없거나 콘텐츠를 다운로드하거나 액세스할 수 없거나 앱 또는 서비스를 사용할 수 없게 하는 기타 통신 시스템 장애에 대해 어떠한 책임도 지지 않습니다. 및/또는 액세스 제어 시스템 하드웨어의 부적절한 상태 또는 시스템 소유자가 사용자에게 모바일 액세스 권한을 부적절하게 부여하여 서비스를 사용할 수 없는 경우. Fit-i는 앱에 대한 지원 또는 유지 관리에 대해 책임을 지지 않습니다. 2.3.9. 앱은 Fit-i가 동일한 유형의 보증을 부여하지 않고 "있는 그대로" 사용할 수 있습니다. Fit-i는 법이 허용하는 최대 범위 내에서 앱과 관련된 모든 묵시적 보증을 부인합니다. 2.3.10. 책임의 제한. 각 당사자는 다음 단락의 제한 사항에 따라 본 EULA에 따른 의무의 중대한 위반으로 인해 직접적이고 필요한 결과로 발생한 손해 및 손실에 대해 상대방에 대해 책임을 져야 합니다. 법이 허용하고 법이 허용하는 범위 내에서 Fit-i는 다음에 대해 책임을 지지 않습니다. 간접적, 특별, 징벌적, 징벌적 또는 결과적 손해 또는 이익 손실. 앱 및/또는 서비스의 액세스, 사용 및 실행의 결과로 사용자에게 발생하거나 사용자가 입은 모든 유형의 손상 또는 손실(앱 설치 및 그러한 설치의 결과). 앱 또는 서비스를 사용할 수 없음으로 인해 발생하는 모든 유형의 손상 또는 손실. 모든 경우에 Fit-i는 합리적으로 예측할 수 없는 손실이나 손해에 대해 책임을 지지 않습니다. 본 EULA의 어떠한 내용도 과실로 인한 사망 또는 부상에 대한 Fit-i의 책임, 사기 또는 사기성 허위 진술 또는 관련 법률에 따라 배제 또는 제한될 수 없는 기타 책임을 배제하거나 제한하지 않습니다.

개인 및 비개인 데이터 3.1 정의 이 조항의 목적: "개인 데이터" 는 식별되거나 식별 가능한 자연인과 관련된 모든 정보를 의미합니다. 식별 가능한 자연인은 특히 이름, 식별 번호, 위치 데이터, 온라인 식별자와 같은 식별자 또는 물리적, 생리적, 해당 자연인의 유전적, 정신적, 경제적, 문화적 또는 사회적 정체성. "비개인 데이터" 는 개인 데이터로 간주되지 않는 사용자로부터 얻은 모든 정보, 즉 식별되거나 식별 가능한 자연인과 관련이 없는 정보를 의미합니다. 3.2 개인 데이터 3.2.1. 앱 및 서비스 사용자의 설치, 액세스 및 사용에는 사용자 개인 데이터 수집 또는 사용자 개인 데이터에 대한 Fit-i의 기타 처리가 포함되지 않습니다. 어떤 경우든 사용자가 이와 관련하여 의심이 가는 경우 사용자는 다음 이메일 주소를 통해 Fit-i의 데이터 보호 책임자에게 질문을 보낼 수 있습니다: skydh1214@naver.com 3.2.2. 위의 내용을 침해하지 않고 사용자는 앱이 Android 운영 체제 버전 6.0 이상인 장치에 설치된 경우 Bluetooth 기술을 사용하여 앱을 통해 문 열기를 수행하기 위해 Android가 사용자에게 수락을 요청할 것임을 알리고 인정합니다. 위치 권한을 활성화합니다. Fit-i는 사용자의 위치 정보에 접근하거나 다른 방식으로 처리하지 않습니다. 3.3 비개인 데이터 3.3.1. 사용자가 앱을 설치, 액세스 및 사용하려면 사용자가 등록 절차를 완료해야 하며, 이를 위해 사용자는 일부 비개인 데이터를 Fit-i에 제공해야 합니다. 또한 앱은 또한 비개인 데이터인 일부 메타데이터(예: 운영 체제, 현지 언어 등)를 사용자의 장치에서 자동으로 얻습니다. 3.3.2. 또한 하나의 특정 위치와 관련하여 모바일 액세스 서비스 사용자가 사용하는 경우 해당 위치의 시스템 소유자는 시스템 소유자가 이전에 수집 및/또는 달리 처리한 사용자의 비개인 데이터 일부를 Fit-i 에 제공해야 합니다. (암호화된 액세스 권한을 포함하되 이에 국한되지 않음). 시스템 소유자는 이러한 비개인 데이터를 Fit-i 로 이전하는 것에 대해 사전에 통지하고 해당되는 경우 해당 동의를 사용자로부터 획득할 책임이 있습니다. 3.3.3. 사용자는 이전 섹션 3.3.1 및 3.3.2에 언급된 비개인 데이터의 저장에 대해 Fit-i 가 제3자 서비스 제공업체와 협력한다는 것을 인정합니다. 사용자는 제3자 서비스 제공자가 특정 경우에 대한민국 외부에 있을 수 있음을 인정합니다. 이러한 이유로 언급된 비개인 데이터는 경우에 따라 대한민국 외부로 이전될 수 있습니다. 어떠한 경우에도 Fit-i 는 그러한 제3자 서비스 제공자의 선택에 대한 엄격한 기준을 따르고 그러한 비개인 데이터의 언급 전송에 필요한 모든 해당 법률을 이행해야 합니다(있는 경우).

EULA 수정 Fit-i 는 이 EULA를 전체 또는 부분적으로 수정할 수 있는 권리와 이 EULA를 보완하는 새로운 조건 및 정책을 추가할 권리를 보유합니다. 본 EULA의 적용 버전은 앱의 메인 화면 메뉴에서 확인할 수 있습니다. 위의 내용에도 불구하고 중요한 변경 사항이 있는 경우 앱 업데이트를 다운로드한 후 및 다음 기능에 대한 액세스 권한이 부여되기 전에 사용자가 요청한 새 조건 및/또는 새 EULA가 앱을 통해 사용자에게 표시됩니다. 앱에서 "동의 및 계속" 상자 또는 기타 동등한 상자를 클릭하여 새 조건 또는 새 EULA를 수락합니다. 새 조건 또는 새 EULA를 수락한 후(그리고 수락한 후에만) 사용자는 앱의 기능에 액세스할 수 있습니다.

기간 및 종료 이 EULA는 사용자가 동일한 내용을 수락하는 순간부터 발효됩니다(따라서 완전한 구속력을 갖음)(섹션 2.2의 조항에 따름). Fit-i 는 사용자가 본 EULA에 동의함으로써 언제든지 사용자와 구독한 계약을 해지할 수 있습니다. 이러한 경우 본 EULA에 따라 부여된 라이선스는 자동으로 취소 및 취소된 것으로 간주됩니다. 사용자는 필요에 따라 사용자가 Fit-i 에 통지하지 않고도 앱을 제거하여 언제든지 본 EULA에 동의함으로써Fit-i 와 구독한 계약을 해지할 수 있습니다. 또한 Fit-i 는 또한 Fit-i 의 기준에 따라 앱 및/또는 적절한 기능을 위해 Fit-i 가 채택한 보안 조치를 약화시킬 수 있는 기술적인 문제가 있는 경우 앱 및/또는 서비스에 대한 액세스를 일시적으로 중단할 수 있는 권리를 보유합니다. 서비스.

기타 조항 이 EULA에 포함된 다양한 섹션 및 하위 섹션의 제목과 제목은 해당 섹션을 읽는 데 도움이 되는 가이드를 제공하기 위한 목적으로만 선택되었습니다. 계약상의 목적을 위해 이러한 제목은 참조하는 섹션 또는 하위 섹션의 내용을 변경하지 않는 것으로 간주됩니다. 이 EULA의 공식 언어는 한글입니다. 영어 버전과 EULA로 번역될 수 있는 다른 버전 사이에 불일치가 있는 경우(사용자의 이해를 돕기 위한 배타적 목적으로) 한글 버전의 내용이 우선합니다. 사용자는 (i) 사용자의 주소가 대한민국의 금수 조치 대상이 되거나 대한민국이 테러 지원 단체로 간주하는 국가에 있지 않으며 (ii) 사용자의 주소가 모든 목록에 대한민국이 금지한 단체로 포함되어 있습니다. 본 EULA의 조항 중 일부가 무효로 선언되거나 효력이 없는 것으로 선언되는 경우, 이 무효 또는 효력의 결여는 나머지 조항의 유효성이나 유효성에 영향을 미치지 않으며, 이는 유효하고 계속 유효합니다. 앞서 언급한 무효 또는 무효가 이 EULA에 명시된 다른 조항에 대한 본질적이고 실질적인 변경을 수반하지 않는 한 유효합니다. 무효로 선언되거나 효력이 없다고 선언된 조항은 포함되지 않은 것으로 간주되며, 새로운 조항으로 대체되거나 법률에서 허용되는 방식으로 해석되며, 그 내용은 Fit-i 가 가질 수 있는 조항과 최대한 유사합니다. 이 조항의 유효성 또는 효과의 부족에 대해 알고 있었던 경우 포함합니다.

입법 및 관할 이 EULA는 대한민국 법률의 적용을 받습니다. 당사자는 자신에게 부여될 수 있는 다른 관할권에 대한 권리를 명시적으로 포기하고 다음과 같은 경우에 본 EULA, 앱, 서비스 또는 사용 또는 기능과 관련하여 발생할 수 있는 모든 논쟁을 제출하는 데 명시적으로 동의합니다.

### **제1조(목적)**

이 약관은 회사가 온라인으로 제공하는 디지털콘텐츠(이하 "콘텐츠"라고 한다) 및 제반서비스의 이용과 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.

### **제2조(정의) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.**

1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
    - "회사"라 함은 서비스를 제공하는 주체를 말합니다.
    - "이용자"라 함은 이 약관에 따라 "회사"가 제공하는 "콘텐츠" 및 제반서비스를 이용하는 회원 및 비회원을 말합니다.
    - "회원"이라 함은 "회사"와 이용계약을 체결하고 "이용자" 아이디(ID)를 부여받은 "이용자"로서 "회사"의 정보를 지속적으로 제공받으며 "회사"가 제공하는 서비스를 지속적으로 이용할 수 있는 자를 말합니다.
    - "비회원"이라 함은 "회원"이 아니면서 "회사"가 제공하는 서비스를 이용하는 자를 말합니다.
    - "콘텐츠"라 함은 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호·문자·음성·음향·이미지 또는 영상 등으로 표현된 자료 또는 정보로서, 그 보존 및 이용에 있어서 효용을 높일 수 있도록 전자적 형태로 제작 또는 처리된 것을 말합니다.
    - "아이디(ID)"라 함은 "회원"의 식별과 서비스이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자 또는 숫자의 조합을 말합니다.
    - "비밀번호(PASSWORD)"라 함은 "회원"이 부여받은 "아이디"와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 말합니다.
    - "둘러보기"라 함은 이용자가 서비스를 이용하면서 정보를 수집하고 게시할 수 있는 공간을 말합니다.
    - "커뮤니티"라 함은 게시물을 게시할 수 있는 공간을 말합니다.
    - "서비스 내부 알림 수단"이란, 팝업, 알림 등을 말합니다.
    - "연락처"란 회원가입 등을 통해 수집된 이용자의 이메일, 휴대전화 번호 등을 의미합니다.
2. 1항에서 정의되지 않은 약관 내 용어의 의미는 일반적인 이용관행에 의합니다.

### **제 3조(약관 등의 명시와 설명 및 개정)**

1. 회사는 이 약관을 회원가입 화면 등에 게시합니다.
2. 회사는 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
3. 개정 내용이 회원에게 불리할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 팝업으로 30일간 게시합니다.
4. 회원이 개정약관에 동의하지 않는 경우, 이용계약을 해지함으로써 거부 의사를 표현할 수 있습니다. 단, 30일 내에 거부 의사 표시를 하지 않을 경우 약관에 동의한 것으로 간주합니다.
5. 회원은 약관 일부분만을 동의 또는 거부할 수 있습니다.
6. 비회원이 서비스를 이용할 경우, 이 약관에 동의한 것으로 간주합니다.

### **제 4조(서비스 제공)**

1. 회사는 다음 서비스를 제공합니다.
    - 환경보호 챌린지 인증 서비스
    - 환경보호 관련 상점 서비스
    - 환경보호 관련 후기 서비스
    - 기타 회사가 정하는 서비스
2. 회사는 운영상, 기술상의 필요에 따라 제공하고 있는 서비스를 변경할 수 있습니다.
3. 회사는 이용자의 개인정보 및 서비스 이용 기록에 따라 서비스 이용에 차이를 둘 수 있습니다.
4. 회사는 천재지변, 인터넷 장애, 경영 약화 등으로 서비스를 더 이상 제공하기 어려울 경우, 서비스를 통보 없이 중단할 수 있습니다.
5. 회사는 1항부터 전항까지와 다음 내용으로 발생한 피해에 대해 어떠한 책임을 지지 않습니다.
    - 모든 서비스, 게시물, 이용 기록의 진본성, 무결성, 신뢰성, 이용가능성
    - 서비스 이용 중 타인과 상호 간에 합의한 내용
    - 게시물, 광고의 버튼, 하이퍼링크 등 외부로 연결된 서비스와 같이 회사가 제공하지 않은 서비스에서 발생한 피해
    - 이용자의 귀책사유 또는 회사의 귀책 사유가 아닌 사유로 발생한 이용자의 피해

### **제 5조(개인정보의 관리 및 보호)**

1. 회원이 회사와 체결한 서비스 이용계약은 처음 이용계약을 체결한 본인에 한해 적용됩니다.
2. 회원은 회원가입 시 등록한 정보에 변동이 있을 경우, 즉시 "내 정보" 메뉴 등을 이용하여 정보를 최신화해야 합니다.
3. 회원의 아이디, 비밀번호 등 모든 개인정보의 관리책임은 본인에게 있으므로, 타인에게 양도 및 대여할 수 없으며, 유출되지 않도록 관리해야 합니다. 만약 본인의 아이디 및 비밀번호를 타인이 사용하고 있음을 인지했을 경우 바로 서비스 내부의 문의 창구에 알려야 하고, 안내가 있는 경우 이에 즉시 따라야 합니다.
4. 회사는 2항부터 전항까지를 이행하지 않아 발생한 피해에 대해 어떠한 책임을 지지 않습니다.

### **제 6조(회원탈퇴 및 자격 상실 등)**

1. "회원"은 "회사"에 언제든지 탈퇴를 요청할 수 있으며 "회사"는 즉시 회원탈퇴를 처리합니다.
2. "회원"이 다음 각호의 사유에 해당하는 경우, "회사"는 회원자격을 제한 및 정지시킬 수 있습니다.
    - 가입신청 시에 허위내용을 등록한 경우
    - 다른 사람의 "회사"의 서비스이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    - "회사"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
3. "회사"가 회원자격을 제한·정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "회사"는 회원자격을 상실시킬 수 있습니다.
4. "회사"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 "회원"에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

### **제 7조(저작권의 귀속)**

1. 회사는 유용하고 편리한 서비스를 제공하기 위해, 2020년부터 서비스 및 서비스 내부의 기능( 환경보호 챌린지 인증, 리필스테이션 정보 제공 등)의 체계와 다양한 기능을 직접 설계 및 운영하고 있는 데이터베이스 제작자에 해당합니다. 회사는 저작권법에 따라 데이터베이스 제작자는 복제권 및 전송권을 포함한 데이터베이스 전부에 대한 권리를 가지고 있으며, 이는 법률에 따라 보호를 받는 대상입니다. 따라서 이용자는 데이터베이스 제작자인 회사의 승인 없이 데이터베이스의 전부 또는 일부를 복제,배포,방송 또는 전송할 수 없습니다.
2. 회사가 작성한 게시물에 대한 권리는 회사에게 귀속되며, 회원이 작성한 게시물에 대한 권리는 회원에게 귀속됩니다. 단, 회사는 서비스의 운영, 확장, 홍보, 데이터 활용 등의 필요한 목적으로 회원의 저작물을 합리적이고 필요한 범위 내에서 별도의 허락 없이 수정하여 무상으로 사용하거나 제휴사에게 제공할 수 있습니다. 이 경우, 회원의 개인정보는 제공하지 않습니다.

### **제 8조(게시물의 게시 중단)**

1. 회사는 관련법에 의거하여 회원의 게시물로 인한 법률상 이익 침해를 근거로, 다른 이용자 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치를 취하거나 관련된 게시물의 게시중단을 요청하는 경우, 회사는 해당 게시물에 대한 접근을 잠정적으로 제한하거나 삭제할 수 있습니다.

### **제 9조(광고의 게재 발신 및 야간광고전송에 대한 수신)**

1. 광고의 게재 및 발신
    - 회사는 서비스의 제공을 위해 서비스 내부에 광고를 게재할 수 있으며, 회사는 이용자의 이용기록을 활용한 광고를 게재할 수 있습니다.
    - 회사는 회원이 광고성 정보 수신에 동의할 경우, 서비스 내부 알림 수단과 회원의 연락처를 이용하여 광고성 정보를 발신할 수 있습니다.
    - 회사는 광고 게재 및 동의된 광고성 정보의 발신으로 인해 발생한 피해에 대해 어떠한 책임도 지지 않습니다.
2. 야간광고전송에 대한 수신
    - 회사는 오후 9시~익일 오전 8시까지 광고 푸시를 전송하는 경우에 광고성 정보가 시작되는 부분에 (광고), 전송자의 명칭을 표시합니다.
    - 광고성 정보가 끝나는 부분에 수신 거부 또는 수신동의 철회를 할 수 있는 방식을 명시합니다.
    - 수신자로부터 사전 동의, 수신 거부 또는 수신동의 철회 의사표시를 받은 경우에는 앱에서 팝업을 통해 처리결과를 통지합니다.

### **제 10조(저작권)**

고객이 작성・게시한 상품리뷰에 관한 저작권은, 해당 상품리뷰를 작성한 고객에게 귀속합니다.

고객은, 당사에 대해서, 당사가 상품리뷰를 다음의 목적으로 이용하는 것 (복제, 양도, 대여, 번역, 번안 및 제3자에 대하여 재이용의 허락을 포함합니다)을 허락하는 것으로 합니다.

(1) 당사 및 당사 그룹회사의 웹사이트나 카탈로그, 선전・광고, SNS 등의 판촉매체에의 게재

(2) 당사 상품의 개량 및 신상품의 개발 전항의 경우, 고객은 당사 (당사로부터 사용허락 또는 권리양도를 받은 제3자를 포함합니다)에 대해, 상품리뷰에 관련된 저작자인격권을 행사하지 않는 것으로 합니다. 고객이 작성・게시한 상품리뷰 이외의, 본 서비스에 관한 저작권 등 일체의 지적재산권은, 당사 또는 당사가 사용 허락하거나 당사로부터 권리양도를 받은 제3자에게 귀속합니다.

당사는, 고객이 작성・게시한 상품리뷰에 포함된 아이디어, 디자인 및 노하우 등 (이하 "아이디어 등"이라고 합니다)을 이용할 수 있고, 아이디어 등에 관련하여 특허, 실용신안, 의장, 상표를 받는 권리 및 출원할 수 있는 것으로 합니다. 당사는 아이디어 등을 고객의 승낙을 얻지 않고 이용 (복제, 양도, 대여, 번역, 번안 및 제3자에 대하여 재이용의 허락을 포함합니다) 할 수 있는 것으로 합니다.

### **제 11조(금지행위)**

1. 이용자는 다음과 같은 행위를 해서는 안됩니다.
    1. 개인정보 또는 계정 기만, 침해, 공유 행위
    - 개인정보를 허위, 누락, 오기, 도용하여 작성하는 행위
    - 타인의 개인정보 및 계정을 수집, 저장, 공개, 이용하는 행위
    - 자신과 타인의 개인정보를 제3자에게 공개, 양도하는 행위
    - 다중 계정을 생성 및 이용하는 행위
    - 자신의 계정을 이용하여 타인의 요청을 이행하는 행위
    1. 시스템 부정행위
    - 이용하지 않은 상점에 대해 허위 사실 기재 및 정보를 제공하는 행위
    - 허가하지 않은 방식의 서비스 이용 행위
    - 회사의 모든 재산에 대한 침해 행위
    1. 업무 방해 행위
    - 서비스 관리자 또는 이에 준하는 자격을 사칭하거나 허가없이 취득하여 직권을 행사하는 행위
    - 회사 및 타인의 명예를 손상시키거나 업무를 방해하는 행위
    - 서비스 내부 정보 일체를 허가 없이 이용, 변조, 삭제 및 외부로 유출하는 행위
    1. 이 약관, 개인정보 처리방침, 커뮤니티 이용규칙에서 이행 및 비이행을 명시한 내용에 반하는 행위
    2. 기타 현행법에 어긋나거나 부적절하다고 판단되는 행위
2. 이용자가 1항에 해당하는 행위를 할 경우, 회사는 다음과 같은 조치를 영구적으로 취할 수 있습니다.
    - 이용자의 서비스 이용 권한, 자격, 혜택 제한 및 회수
    - 회원과 체결된 이용계약을 회원의 동의나 통보 없이 파기
    - 회원가입, 정보 접근, 게시글 작성 거부
    - 회원의 커뮤니티, 게시물, 이용기록을 임의로 삭제, 중단, 변경
    - 그 외 회사가 필요하다고 판단되는 조치
3. 회사는 1항부터 전항까지로 인해 발생한 피해에 대해 어떠한 책임을 지지 않으며, 이용자는 귀책사유로 인해 발생한 모든 손해를 배상할 책임이 있습니다.

### **제 12조(기타)**

1. 이 약관은 2022년 3월 16일에 최신화 되었습니다.
2. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관련법 또는 관례에 따릅니다.
3. 이 약관에도 불구하고 다른 약관이나 서비스 이용 중 안내 문구 등으로 달리 정함이 있는 경우에는 해당 내용을 우선으로 합니다.
"""
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.font = UIFont.systemFont(ofSize: 15.0)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy(){
        view.addSubview(myPageTitleLabel)
        view.addSubview(textView1)
    }
    
    func setConstraints(){
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        textView1.snp.makeConstraints { make in
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
