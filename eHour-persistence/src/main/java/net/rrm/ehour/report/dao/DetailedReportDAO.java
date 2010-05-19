/*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

package net.rrm.ehour.report.dao;

import java.io.Serializable;
import java.util.List;

import net.rrm.ehour.data.DateRange;
import net.rrm.ehour.report.reports.element.FlatReportElement;

/**
 * TODO 
 **/

public interface DetailedReportDAO
{
	
	/**
	 * TODO refactor method signatures (perMonth vs Weekly? hmm)
	 * @param userId
	 * @param projectId
	 * @param dateRange
	 * @return
	 */
//	public List<FlatProjectAssignmentAggregate> getHoursPerMonthPerAssignmentForUsers(List<Serializable> userId, List<Serializable> projectId, DateRange dateRange);
//	
//	public List<FlatProjectAssignmentAggregate> getHoursPerMonthPerAssignmentForUsers(List<Serializable> userId, DateRange dateRange);
//	
//	public List<FlatProjectAssignmentAggregate> getHoursPerMonthPerAssignment(DateRange dateRange);
//	
//	public List<FlatProjectAssignmentAggregate> getHoursPerMonthPerAssignmentForProjects(List<Serializable> projectId, DateRange dateRange);
	
	/**
	 * Get hours per day for assignments
	 * @param assignmentId
	 * @param dateRange
	 * @return
	 */
	public List<FlatReportElement> getHoursPerDayForAssignment(List<Serializable> assignmentId, DateRange dateRange);

	/**
	 * Get hours per day for users
	 * @param userIds
	 * @param dateRange
	 * @return
	 */
	public List<FlatReportElement> getHoursPerDayForUsers(List<Serializable> userIds, DateRange dateRange);

	/**
	 * Get hours per day for projects
	 * @param userIds
	 * @param dateRange
	 * @return
	 */
	public List<FlatReportElement> getHoursPerDayForProjects(List<Serializable> projectIds, DateRange dateRange);

	/**
	 * Get hours per day for projects & users
	 * @param userIds
	 * @param dateRange
	 * @return
	 */
	public List<FlatReportElement> getHoursPerDayForProjectsAndUsers(List<Serializable> projectIds, List<Serializable> userIds, DateRange dateRange);

	/**
	 * Get hours per day
	 * @param dateRange
	 * @return
	 */
	public List<FlatReportElement> getHoursPerDay(DateRange dateRange);

}