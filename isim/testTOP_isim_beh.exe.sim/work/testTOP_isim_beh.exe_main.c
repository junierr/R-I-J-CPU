/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_1256727229_init();
    xilinxcorelib_ver_m_00000000001687936702_1862936372_init();
    xilinxcorelib_ver_m_00000000000277421008_0286064276_init();
    xilinxcorelib_ver_m_00000000001603977570_1412728793_init();
    work_m_00000000002489990758_3304215864_init();
    work_m_00000000001595211638_0015000728_init();
    work_m_00000000000137697834_3535081231_init();
    work_m_00000000003533294776_0886308060_init();
    work_m_00000000002869072249_2309632077_init();
    xilinxcorelib_ver_m_00000000000277421008_1219078739_init();
    xilinxcorelib_ver_m_00000000001603977570_1273739595_init();
    work_m_00000000000403262735_3173282737_init();
    work_m_00000000001351924779_3508565487_init();
    work_m_00000000001636655413_3823007873_init();
    work_m_00000000002231278267_2829680089_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002231278267_2829680089");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
