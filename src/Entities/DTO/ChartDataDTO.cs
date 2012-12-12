using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Brato.Entities.DTO
{
    public class ChartDataDTO<TA>
    {
        private string p;

        public ChartDataDTO()
        {
        }

        public ChartDataDTO(TA x, int y)
        {
            xAxis = x;
            yAxis = y;
        }

        public TA xAxis { get; set; }

        public decimal yAxis { get; set; }
    }
}
